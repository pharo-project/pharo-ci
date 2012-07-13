#!/usr/bin/env ruby

require 'fileutils'
require 'timeout'

# ============================================================================

def colorize(text, color_code)
  "\033#{color_code}#{text}\033[0m"
end

def red(text)
    colorize(text, "[31m")
end

def green(text)
    colorize(text, "[32m")
end

def blue(text)
    colorize(text, "[34m")
end

# ============================================================================

def help(msg=nil, exitStatus=0)
    if msg
        $stderr.puts red(msg)
        $stderr.puts ""
    end

    $stderr.puts "usage /.image [options] issueNumber"
    $stderr.puts ""
    $stderr.puts "    Loads and tests an issue from the google issue tracker at" 
    $stderr.puts "    http://code.google.com/p/pharo/issues/list"
    $stderr.puts "    This script will update the issue status and adds comments if the errors "
    $stderr.puts "    occur during loading"
    $stderr.puts ""
    $stderr.puts "    $PHARO_CI_USER is used as the code.google.com user"
    $stderr.puts "    $PHARO_CI_PWD is used for the password"
    $stderr.puts ""
    $stderr.puts ""
    $stderr.puts "    --hack     edit the sources of this script"
    $stderr.puts "    --batch    run the script without human interaction needed"
    $stderr.puts "    -h/--help  show this help text"
   
    exit exitStatus
end

def editor()
    if ENV['EDITOR']
        return ENV['EDITOR']
    else
        return 'vim'
    end
end

def guard()
    if !$?.success?
        puts red("FAILURE #{$?.to_i}")
        exit($?.to_i)
    end
end

def error(message)
    $stderr.puts red(msg)
    exit(1)
end
# ============================================================================

def googleCodeUser
    return ENV['PHARO_CI_USER']  if ENV.has_key? 'PHARO_CI_USER'
    error("No Pharo User (PHARO_CI_USR) defined") if (!INTERACTIVE) 
    
    puts "Enter code.google.com username: "
    return ENV['PHARO_CI_USER'] = gets().chomp
end

def googleCodePassword
    return ENV['PHARO_CI_PWD'] if ENV.has_key? 'PHARO_CI_PWD'
    #TODO: support for keyring under ubuntu
    #TODO: mask password form the command line
    
    error("No Pharo Password (PHARO_CI_PWD) defined") if (!INTERACTIVE) 
  
    password = `security find-internet-password -a #{googleCodeUser()} -g 2>&1 | grep password`
    if not password.nil? 
        return ENV['PHARO_CI_PWD'] = password.split[1][1..-2]
    end
    puts "Password for #{googleCodeUser()}: "
    return ENV['PHARO_CI_PWD'] = gets.chomp
end

# ============================================================================

if $*[0] == "--help" || $*[0] == "-h"
    help()
    exit 0
elsif $*[0] == "--hack"
    sourceFile = `readlink #{__FILE__} || echo #{__FILE__}`.chomp
    exec(editor(), sourceFile)
elsif $*[0] == "--batch"
    INTERACTIVE = false
    ARGV.shift
else
    INTERACTIVE = true
end

if ARGV.empty?
    issueNumber = ""
elsif $*[0][0] == '-' || $*.size != 1 || $*[0].to_i == 0
    help("invalid arguments \"#{$*.join}\"", 1)
    INTERACTIVE = true
else
    issueNumber = ARGV.last    
end


# ===========================================================================
updateImage = true
imageUrl    = "https://ci.lille.inria.fr/pharo/job/CI/lastSuccessfulBuild/artifact/CI.zip"
artifact    = "CI"
name        = "CI"
destination = "Monkey#{issueNumber}"


# ============================================================================

if File.exists? destination
        
    puts red("Issue has been loaded before:")+" #{Dir.pwd}/#{destination}" if INTERACTIVE
    while INTERACTIVE
        print 'exit[e], reuse[r] or delete[D] files: '
        result = $stdin.gets.downcase.chomp
        break if ['e', 'r', 'd'].include? result
        break if result.empty?
    end

    
  case result
    when 'e'
      exit 0
    when 'r'    
      puts red('resuse not yet implemented')
      exit 1
    else
      `rm -rf #{destination}`
  end
end

# ============================================================================

if updateImage
    puts blue("Fetching the latest image")
    puts "    #{imageUrl}"
        `curl #{'--progress-bar' if INTERACTIVE} -o "artifact#{issueNumber}.zip" "#{imageUrl}" \
        && cp "artifact#{issueNumber}.zip" "backup.zip"  \
        || cp "backup.zip" "artifact#{issueNumber}.zip"`
else
    `cp "backup.zip" "artifact#{issueNumber}.zip"`
end
guard()

# ============================================================================
puts blue("Unzipping archive")

`unzip -x "artifact#{issueNumber}.zip" -d "#{destination}" && rm -rf "#{destination}/__MACOSX"`
Dir::chdir(destination)
guard()

imagePath = `find . -name "*.image"`.chomp
imagePath = imagePath.chomp(File.extname(imagePath))
FileUtils.move(imagePath+'.image', "Monkey#{issueNumber}.image")
FileUtils.move(imagePath+'.changes', "Monkey#{issueNumber}.changes")

if File.exists? File.dirname(imagePath)+"/PharoV10.sources"
    FileUtils.move(File.dirname(imagePath)+"/PharoV10.sources", "PharoV10.sources")
end

# ============================================================================
puts blue("Cleaning up unzipped files")

`rm "../artifact#{issueNumber}.zip"`
guard()

# ===========================================================================

#if !system("ping -c 1 ss3.gemstone.com > /dev/null")
#    puts red('Could not find ss3.gemstone.com')
#    exit 1
#end

# ===========================================================================
puts blue("Fetching the latest VM pharo scripts")

`test -e pharo-build || git clone --depth=1 git://gitorious.org/pharo-build/pharo-build.git`
`git --git-dir=pharo-build/.git pull`
guard()


# Loading the latest VM =====================================================

if !ENV.has_key? 'PHARO_VM'
  puts blue("$PHARO_VM is undefined, loading latest VM: ")
  puts ENV['PHARO_VM'] = `cd pharo-build && pharo-shell-scripts/fetchLatestVM.sh 2> /dev/null`.chomp
  guard()
end

# ===========================================================================


File.open("issueLoading.st", 'w') {|f| 
f.puts <<IDENTIFIER
| tracker issue color red green blue issueNumber |
"===================================="

"some helper blocks for error printing"

color := [:colorCode :text|
    FileStream stderr 
        "set the color"
        nextPut: Character escape; nextPut: $[; print: colorCode; nextPut: $m;
        nextPutAll: text; crlf;
        "reset the color"
        nextPut: Character escape; nextPutAll: '[0m'.
].

red   := [:text| color value: 31 text ].
green := [:text| color value: 32 value: text ].
blue  := [:text| color value: 34 value: text ].

"===================================="
"===================================="

World submorphs do: [:each | each delete ].

Smalltalk garbageCollect.
Smalltalk garbageCollect.
Smalltalk garbageCollect.

Author fullName: 'MonkeyGalactikalIntegrator'.

"===================================="

blue value: 'Updating the image'.

UpdateStreamer new 
    beSilent; 
    elementaryReadServerUpdates.

"===================================="

blue value: 'Installing Continuous Integration Services'.

Gofer new
	url: 'http://ss3.gemstone.com/ss/ci';
	package: 'ConfigurationOfCI';
	load.
	
(Smalltalk at: #ConfigurationOfCI) perform: #loadFull.

"===================================="
[ 
"===================================="

tracker := GoogleIssueTracker pharo.
tracker authenticate: '#{googleCodeUser()}' with: '#{googleCodePassword()}'.

"===================================="
issue := '#{issueNumber}' isEmpty
    ifTrue:  [ tracker nextIssue ]
    ifFalse: [ tracker issue: '#{issueNumber}' asInteger ].

issue ifNil: [ 
    red value: 'No more issues to be checked'.
    "Smalltalk exitFail" ].

issueNumber := issue id.

blue value: 'Loading tracker issue ', issueNumber printString.
FileStream stdout print: issueNumber.

blue value: 'Opening image for issue ', issueNumber printString.
blue value: ' http://code.google.com/p/pharo/issues/detail?id=', issueNumber printString.

"===================================="

blue value: 'Running tests'.
changeLoader := issue loadAndTest.

changeLoader isGreen
    ifFalse:  [ 
        red value: 'Issue ', issueNumber printString, ' has errors'.
        issue changeLoader buildRedReportOn: FileStream stderr]
    ifTrue: [ 
        green value: 'Issue ', issueNumber printString, ' is ready for integration'
       ].
    
"===================================="

] on: Error fork: [ :error|
    "output the Error warning in red"
    red value: 'Failed to load Issue:'.
    FileStream stderr print: error; crlf.

    "should do an exit 1 here"

    "open the error"
    error pass.
].

"===================================="

Smalltalk snapshot: true andQuit: true.

Workspace openContents: ' 
issue := Smalltalk at: #''Issue ''', issueNumber printString, '.
issue changeLoader errors
'.

IDENTIFIER
}

pid = 0
begin
    #kill the build process after 1 hour
    timeout(60 * 60) {
        if INTERACTIVE
            option = ""
        else
            option = "-headless"
        end
        puts blue('STARTING EXPORT')
        pid = fork do
          issueNumber=`$PHARO_VM #{option} '#{Dir.pwd}/Monkey#{issueNumber}.image' '#{Dir.pwd}/issueLoading.st'`.chomp
          guard()
        end
        
        Process.wait
        guard()
    }
rescue Timeout::Error    
    Process.kill('KILL', pid)
    Process.kill('KILL', pid+1) #this is pure guess...
    puts red('Timeout: ') + blue("Loading #{issueNumber} took longer than 15mins")
    File.open("issueLoading.st", 'w') {|f| 
        f.puts <<IDENTIFIER
"===================================="
tracker := GoogleIssueTracker pharo.
tracker authenticate: 'pharo.ulysse@gmail.com' with: 'AydsInJis'.
"===================================="

issue := tracker issue: #{issueNumber}.
issue reviewNeeded: 'Timeout occured while loading and testing the code'.
Smalltalk snapshot: false andQuit: true.
IDENTIFIER
    }
    `$PHARO_VM "#{Dir.pwd}/Monkey#{issueNumber}.image" "#{Dir.pwd}/issueLoading.st"`
    guard()
end

# ===========================================================================

while INTERACTIVE
    print "Remove the folder #{Dir.pwd} [yN]?"
    result = $stdin.gets.downcase.chomp
    break if ['y', 'n',].include? result
    break if result.empty?
end

case result
when 'y'
    `cd .. && rm -R "#{Dir.pwd}"`
else
    `open "#{Dir.pwd}"` if INTERACTIVE
end

# ===========================================================================

puts `date`
`open "http://code.google.com/p/pharo/issues/detail?id=#{issueNumber}" || gnome-open "http://code.google.com/p/pharo/issues/detail?id=#{issueNumber}"` if INTERACTIVE
