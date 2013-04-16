#!/usr/bin/env ruby
require 'net/http'
require 'uri'

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

PHARO_VERSION = ARGV[0].to_i()

# find the script location
def dir
    begin
        return File.readlink($0)
    rescue
        return $0
    end
end
DIR = File.dirname(dir)


# find the last version =======================================================
versionFile = nil
versionNumber = 0

# check if the file exists on our main servers...
puts blue("Trying prebuilt images:")
FILE_SERVER="http://pharo.gforge.inria.fr/ci/image/"
PHARO_VERSION.downto(1000) {|i|
    url = FILE_SERVER + i.to_s[0..1] + '/' + i.to_s + '.zip'
    puts url
    res = Net::HTTP.get_response(URI.parse(url))
    if res.kind_of? Net::HTTPOK
        versionFile = url
        versionNumber = i
        break
    end
}


# ==============================================================================
puts blue("Using pharo version #{versionNumber} as base image")

downloadZip = "pharo#{versionNumber}.zip"
`#{DIR}/../download.sh #{downloadZip} #{versionFile}`

system("unzip -o #{downloadZip} *.image *.changes")
# do some awk magic to find the extracted names...
extractedFiles = `unzip -lo #{downloadZip} *.image *.changes -x __MACOSX/* | awk '/-----/ {p = ++p % 2; next} p {print $NF}'`
puts blue('Extracted:')
puts extractedFiles

# get the first extracted filename
baseName = extractedFiles.split.first
# get everything before the last dot (ugly for ruby 1.8.6)
baseName = baseName.split('.')[0..-2].join('.')
# Potentially dangerous as it might not match the proper images..
`mv #{baseName}.image Pharo-#{PHARO_VERSION}.image`
`mv #{baseName}.changes Pharo-#{PHARO_VERSION}.changes`
`rm -rf #{downloadZip}`

if versionNumber == PHARO_VERSION
    exit
end

# ==============================================================================
File.open("updateTo#{PHARO_VERSION}.st", 'w') {|f| 
f.puts <<IDENTIFIER

Deprecation raiseWarning: false.

UpdateStreamer new
	upToNumber: #{PHARO_VERSION};
	updateFromServer.

"For some reason the update is only triggered the second time"
UpdateStreamer new
    upToNumber: #{PHARO_VERSION};
    updateFromServer.

Smalltalk snapshot: true andQuit: true.
IDENTIFIER
}

# Loading the latest VM =======================================================

#TODO need to check for older vm versions...
if !ENV.has_key? 'PHARO_VM'
    puts blue("$PHARO_VM is undefined, loading latest VM: ")
    puts ENV['PHARO_VM'] = `#{DIR}/fetchLatestVM.sh 2> /dev/null`.chomp
end

SOURCES="https://gforge.inria.fr/frs/download.php/24391/PharoV10.sources.zip"
`test -e PharoV10.sources || (wget --quiet --no-check-certificate #{SOURCES}; unzip PharoV10.sources.zip)`

# exporting the pharo sources =================================================
puts blue("Updating the image Pharo-#{PHARO_VERSION}.image")

system("$PHARO_VM -headless $PWD/Pharo-#{PHARO_VERSION}.image $PWD/updateTo#{PHARO_VERSION}.st")
`rm $PWD/updateTo#{PHARO_VERSION}.st`

# check the version ==========================================================
puts blue("Double check the loaded version")

File.open("versionCheck#{PHARO_VERSION}.st", 'w') {|f|
    f.puts <<IDENTIFIER
FileStream stdout nextPutAll: SystemVersion current highestUpdate asString.
Smalltalk exit: 0.
IDENTIFIER
}

LOADED_VERSION = `$PHARO_VM -headless $PWD/Pharo-#{PHARO_VERSION}.image $PWD/versionCheck#{PHARO_VERSION}.st`
`rm versionCheck#{PHARO_VERSION}.st`

if LOADED_VERSION.to_i != PHARO_VERSION.to_i
    puts red("Could not load given version! Loaded version is #{LOADED_VERSION} instead of #{PHARO_VERSION}")
    exit 10
end
