#!/usr/bin/env ruby

require 'fileutils'

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

def yellow(text)
    colorize(text, "[33m")
end

def dir
    begin
        return File.readlink $0
    rescue
        return $0
    end
end
DIR = File.dirname dir

# ============================================================================

VERSION = ARGV[0].to_i

puts yellow("Exporting Pharo Version #{VERSION}")

# ============================================================================
puts yellow("Updating local git resources")

# assume that when we're in a git repository it is the phato-build one
if File.exist? DIR+'/../.git'
    SCRIPTS = DIR+'/../'
else 
   SCRIPTS = 'pharo-build/'
    `test -e pharo-build || git clone --depth=1 git@gitorious.org:pharo-build/pharo-build.git`
    `git --git-dir=pharo-build/.git pull`
end
 
puts REPOS="git@github.com:PharoProject/pharo-core.git"
`test -e pharo-core || git clone --no-checkout #{REPOS}`
`git --git-dir=pharo-core/.git pull`
`rm -rf pharo-core/*`


SOURCES="https://gforge.inria.fr/frs/download.php/24391/PharoV10.sources.zip"
`test -e PharoV10.sources || (wget --quiet --no-check-certificate #{SOURCES}; unzip PharoV10.sources.zip)`

# Loading the latest VM =======================================================

if !ENV.has_key? 'PHARO_VM'
  puts yellow("$PHARO_VM is undefined, loading latest VM: ")
  puts ENV['PHARO_VM'] = `#{SCRIPTS}pharo-shell-scripts/fetchLatestVM.sh 2> /dev/null`.chomp
end

# loading the proper image ====================================================
puts yellow("Loading image version #{VERSION}")
system("#{SCRIPTS}/pharo-shell-scripts/fetchPharoVersion.rb #{VERSION}")

# exporting the pharo sources =================================================
puts yellow("Updating the image and exporting all sources ")

`$PHARO_VM -headless Pharo-#{VERSION}.image #{SCRIPTS}/scripts/pharo/pharo-2.0-git-tracker.st`

`touch pharo-core/#{VERSION}`
`echo #{VERSION} > #{VERSION}`
