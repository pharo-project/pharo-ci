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

def blue(text)
    colorize(text, "[34m")
end

def dir
    begin
        return File.readlink($0)
    rescue
        return $0
    end
end
DIR = File.dirname(dir)

# ============================================================================

PHARO_VERSION = ARGV[0].to_i()

puts blue("Exporting Pharo Version #{PHARO_VERSION}")

# ============================================================================
puts blue("Updating local git resources")

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
  puts blue("$PHARO_VM is undefined, loading latest VM: ")
  puts ENV['PHARO_VM'] = `#{SCRIPTS}pharo-shell-scripts/fetchLatestVM.sh 2> /dev/null`.chomp
end

# loading the proper image ====================================================
puts blue("Loading image version #{PHARO_VERSION}")
system("#{SCRIPTS}/pharo-shell-scripts/fetchPharoVersion.rb #{PHARO_VERSION}")

# exporting the pharo sources =================================================
puts blue("Updating the image and exporting all sources ")

`$PHARO_VM -headless Pharo-#{PHARO_VERSION}.image #{SCRIPTS}/scripts/pharo/pharo-2.0-git-tracker.st`

`touch pharo-core/#{PHARO_VERSION}`
`echo #{PHARO_VERSION} > #{PHARO_VERSION}`
