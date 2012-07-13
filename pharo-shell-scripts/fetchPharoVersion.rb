#!/usr/bin/env ruby


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

# PharoImage Versions ==========================================================
versions = {
20200 => 'https://ci.lille.inria.fr/pharo/job/Pharo-2.0/202/artifact/Pharo-2.0.zip',
20195 => 'https://ci.lille.inria.fr/pharo/job/Pharo-2.0/198/artifact/Pharo-2.0.zip',
20175 => 'https://ci.lille.inria.fr/pharo/job/Pharo-2.0/183/artifact/Pharo-2.0.zip',

20156 => 'https://gforge.inria.fr/frs/download.php/31073/Pharo-2.0-156.zip',
20144 => 'https://gforge.inria.fr/frs/download.php/31047/Pharo-2.0-144.zip',
20143 => 'https://gforge.inria.fr/frs/download.php/31046/Pharo-2.0-143.zip',
20132 => 'https://gforge.inria.fr/frs/download.php/30964/Pharo-2.0-20132.zip',
20099 => 'https://gforge.inria.fr/frs/download.php/30856/Pharo-2.0-099.zip',
20079 => 'https://gforge.inria.fr/frs/download.php/30803/Pharo-2.0-079.zip',
20070 => 'https://gforge.inria.fr/frs/download.php/30759/Pharo-2.0-070.zip',
20007 => 'https://gforge.inria.fr/frs/download.php/30625/Pharo-2.0-007.zip',
20000 => 'https://gforge.inria.fr/frs/download.php/30614/Pharo-2.0.zip',

# 1.4
14438 => 'https://gforge.inria.fr/frs/download.php/30620/Pharo-1.4-14438.zip',
14437 => "https://gforge.inria.fr/frs/download.php/30613/Pharo-1.4-14437.zip",
14433 => "https://gforge.inria.fr/frs/download.php/30607/Pharo-1.4-14433.zip",
14411 => "https://gforge.inria.fr/frs/download.php/30466/Pharo-1.4-14411.zip",
14363 => "https://gforge.inria.fr/frs/download.php/30286/Pharo-1.4-14363.zip",
14342 => "https://gforge.inria.fr/frs/download.php/30246/Pharo-1.4-14342.zip",
14315 => "https://gforge.inria.fr/frs/download.php/30201/Pharo-1.4-14315.zip",
14284 => "https://gforge.inria.fr/frs/download.php/30126/Pharo-1.4-14284.zip",
14263 => "https://gforge.inria.fr/frs/download.php/30017/Pharo-1.4-14263.zip",
14243 => "https://gforge.inria.fr/frs/download.php/29894/Pharo-1.4-14243.zip",
14225 => "https://gforge.inria.fr/frs/download.php/29398/Pharo-1.4-14225.zip",
14210 => "https://gforge.inria.fr/frs/download.php/29327/Pharo-1.4-14210.zip",
14196 => "https://gforge.inria.fr/frs/download.php/29262/Pharo-1.4-14196.zip",
14163 => "https://gforge.inria.fr/frs/download.php/29095/Pharo-1.4-14163.zip",
14142 => "https://gforge.inria.fr/frs/download.php/29027/Pharo-1.4-14142.zip",
14120 => "https://gforge.inria.fr/frs/download.php/28936/Pharo-1.4-14120.zip",
14101 => "https://gforge.inria.fr/frs/download.php/28890/Pharo-1.4-14101.zip",
14087 => "https://gforge.inria.fr/frs/download.php/28873/Pharo-1.4-14087.zip",
14073 => "https://gforge.inria.fr/frs/download.php/28834/Pharo-1.4-14073.zip",
14066 => "https://gforge.inria.fr/frs/download.php/28830/Pharo-1.4-14066.zip",
14065 => "https://gforge.inria.fr/frs/download.php/28827/Pharo-1.4-14065.zip",
14048 => "https://gforge.inria.fr/frs/download.php/28785/Pharo-1.4-14048.zip",
14025 => "https://gforge.inria.fr/frs/download.php/28710/Pharo-1.4-14025.zip",
14013 => "https://gforge.inria.fr/frs/download.php/28671/Pharo-1.4-14013.zip",
14000 => 'https://gforge.inria.fr/frs/download.php/28660/PharoCore-1.4-14000.zip',

#1.3
13257 => 'https://gforge.inria.fr/frs/download.php/28638/Pharo-1.3-13257.zip',
13328 => "https://gforge.inria.fr/frs/download.php/30568/Pharo-1.3-13328.zip",
13327 => "https://gforge.inria.fr/frs/download.php/30465/Pharo-1.3-13327.zip",
13315 => "https://gforge.inria.fr/frs/download.php/29273/Pharo-1.3-13315.zip",
13307 => "https://gforge.inria.fr/frs/download.php/29053/Pharo-1.3-13307.zip",
13299 => "https://gforge.inria.fr/frs/download.php/28892/Pharo-1.3-13299.zip",
13298 => "https://gforge.inria.fr/frs/download.php/28860/Pharo-1.3-13298.zip",
13281 => "https://gforge.inria.fr/frs/download.php/28709/Pharo-1.3-13281.zip",
13257 => "https://gforge.inria.fr/frs/download.php/28638/Pharo-1.3-13257.zip",
13201 => "https://gforge.inria.fr/frs/download.php/28547/Pharo-1.3-13201.zip",
13173 => "https://gforge.inria.fr/frs/download.php/28517/Pharo-1.3-13173.zip",


#1.2
12353 => "https://gforge.inria.fr/frs/download.php/28554/Pharo-1.2.2-12353.zip",
12345 => 'https://gforge.inria.fr/frs/download.php/28435/Pharo-1.2.1-11.04.03.zip',
#1.1
11409 => "https://gforge.inria.fr/frs/download.php/27254/Pharo-1.1-11409-rc4dev10.07.2.zip",
11406 => "https://gforge.inria.fr/frs/download.php/27241/Pharo-1.1-11406-rc3dev10.07.1.zip",
11400 => "https://gforge.inria.fr/frs/download.php/27159/Pharo-1.1-11400-rc2dev10.06.1.zip",
11367 => "https://gforge.inria.fr/frs/download.php/27025/Pharo-1.1-11367-Betadev10.05.1.zip",
11112 => "https://gforge.inria.fr/frs/download.php/25123/pharo1.1-11112-alphadev09.12.2.zip",
11073 => "https://gforge.inria.fr/frs/download.php/24978/pharo1.1-11073-alphadev09.12.1.zip",

#1.0
10505 => "https://gforge.inria.fr/frs/download.php/25156/pharo1.0-10505-rc1dev10.01.1.zip",
10502 => "https://gforge.inria.fr/frs/download.php/25121/pharo1.0-10502-rc1dev09.12.2.zip",
10500 => "https://gforge.inria.fr/frs/download.php/24976/pharo1.0-10500-rc1dev09.12.1.zip",
10496 => "https://gforge.inria.fr/frs/download.php/24829/pharo1.0-10496-rc1dev09.11.4.zip",
10495 => "https://gforge.inria.fr/frs/download.php/24750/pharo1.0-10495-rc1dev09.11.3.zip",
10493 => "https://gforge.inria.fr/frs/download.php/24658/pharo1.0-10493-rc1dev09.11.2.zip",
10492 => "https://gforge.inria.fr/frs/download.php/24626/pharo1.0-10492-rc1dev09.11.1.zip",
10491 => "https://gforge.inria.fr/frs/download.php/24392/pharo1.0-10491-rc1dev09.10.5.zip",
10487 => "https://gforge.inria.fr/frs/download.php/24359/pharo1.0-10487-BETAdev09.10.4.zip",
10477 => "https://gforge.inria.fr/frs/download.php/24357/pharo1.0-10477-BETAdev09.10.3.zip",
10470 => "https://gforge.inria.fr/frs/download.php/24335/pharo1.0-10470-BETAdev09.10.2.zip",
10466 => "https://gforge.inria.fr/frs/download.php/24184/pharo1.0-10466-BETAdev09.10.1.zip",
10451 => "https://gforge.inria.fr/frs/download.php/23258/pharo1.0-10451-BETAdev09.09.3.zip",
10446 => "https://gforge.inria.fr/frs/download.php/23173/pharo1.0-10446-BETAdev09.09.2.zip",
10440 => "https://gforge.inria.fr/frs/download.php/23087/pharo1.0-10440-BETAdev09.09.1.zip",
10418 => "https://gforge.inria.fr/frs/download.php/22776/pharo1.0-10418-BETAdev09.08.2.zip",

10388 => "https://gforge.inria.fr/frs/download.php/22695/pharo0.1-10388dev09.07.4.zip",
10379 => "https://gforge.inria.fr/frs/download.php/22644/pharo0.1-10379dev09.07.3.zip",
10373 => "https://gforge.inria.fr/frs/download.php/22622/pharo0.1-10373dev09.07.2.zip",
10371 => "https://gforge.inria.fr/frs/download.php/22610/pharo0.1-10371dev09.07.1.zip",
10342 => "https://gforge.inria.fr/frs/download.php/22456/pharo0.1-10342dev09.06.3.zip",
10332 => "https://gforge.inria.fr/frs/download.php/22427/pharo0.1-10332dev09.06.2.zip",
10324 => "https://gforge.inria.fr/frs/download.php/22396/pharo0.1-10324dev09.06.1.zip",
10318 => "https://gforge.inria.fr/frs/download.php/22356/pharo0.1-10318dev09.05.4.zip",
10309 => "https://gforge.inria.fr/frs/download.php/22298/pharo0.1-10309dev09.05.3.zip",
10306 => "https://gforge.inria.fr/frs/download.php/22285/pharo0.1-10306dev09.05.2.zip",
10303 => "https://gforge.inria.fr/frs/download.php/22261/pharo0.1-10303dev09.05.1.zip",
10292 => "https://gforge.inria.fr/frs/download.php/22118/pharo0.1-10292dev09.04.6.zip",
10289 => "https://gforge.inria.fr/frs/download.php/22100/pharo0.1-10289dev09.04.5.zip",
10284 => "https://gforge.inria.fr/frs/download.php/21875/pharo0.1-10284dev09.04.4.zip",
10279 => "https://gforge.inria.fr/frs/download.php/21842/pharo0.1-10279dev09.04.3.zip",
10277 => "https://gforge.inria.fr/frs/download.php/21540/pharo0.1-10277dev09.04.2.zip",
10268 => "https://gforge.inria.fr/frs/download.php/20709/pharo0.1-10268dev09.04.1.zip",
10259 => "https://gforge.inria.fr/frs/download.php/19554/pharo0.1-10259dev09.03.3.zip",
10250 => "https://gforge.inria.fr/frs/download.php/19487/pharo0.1-10250dev09.03.2.zip",
10248 => "https://gforge.inria.fr/frs/download.php/19450/pharo0.1-10248dev09.03.1.zip",
10243 => "https://gforge.inria.fr/frs/download.php/18192/pharo0.1-10243dev09.02.3.zip",
10236 => "https://gforge.inria.fr/frs/download.php/17631/pharo0.1-10236dev09.02.2.zip",
10231 => "https://gforge.inria.fr/frs/download.php/17092/pharo0.1-10231dev09.02.1.zip",
10213 => "https://gforge.inria.fr/frs/download.php/16049/pharo0.1-10213dev09.01.3.zip",
10211 => "https://gforge.inria.fr/frs/download.php/15599/pharo0.1-10211dev09.01.2.zip",
10205 => "https://gforge.inria.fr/frs/download.php/14363/pharo0.1-10205dev09.01.1.zip",
10201 => "https://gforge.inria.fr/frs/download.php/13831/pharo0.1-10201dev09.01.0-alpha.zip",
10196 => "https://gforge.inria.fr/frs/download.php/12625/pharo0.1-10196dev08.12.3.zip",
10193 => "https://gforge.inria.fr/frs/download.php/12442/pharo0.1-10193dev08.12.2.zip",
10185 => "https://gforge.inria.fr/frs/download.php/12346/pharo0.1-10185dev08.12.1.zip",
10178 => "https://gforge.inria.fr/frs/download.php/11845/pharo0.1-10178dev08.11.7.zip",
10166 => "https://gforge.inria.fr/frs/download.php/11507/pharo0.1-10166dev08.11.6.zip",
10160 => "https://gforge.inria.fr/frs/download.php/11018/pharo0.1-10160dev08.11.5.zip",
10156 => "https://gforge.inria.fr/frs/download.php/10979/pharo0.1-10156dev08.11.4.zip",
10144 => "https://gforge.inria.fr/frs/download.php/10934/pharo0.1-10144dev08.11.3.zip",
10142 => "https://gforge.inria.fr/frs/download.php/10931/pharo0.1-10142dev08.11.2.zip",
10133 => "https://gforge.inria.fr/frs/download.php/10898/pharo0.1-10133dev08.11.1.zip",
10107 => "https://gforge.inria.fr/frs/download.php/10408/pharo0.1-10107dev08.10.4.zip",
10101 => "https://gforge.inria.fr/frs/download.php/9886/pharo0.1-10101dev08.10.3.zip",
10097 => "https://gforge.inria.fr/frs/download.php/9636/pharo0.1-10097dev08.10.2.zip",
10082 => "https://gforge.inria.fr/frs/download.php/8098/pharo0.1-10082dev08.10.1.zip",
10074 => "https://gforge.inria.fr/frs/download.php/7404/pharo0.1-10074dev08.09.2.zip",
10062 => "https://gforge.inria.fr/frs/download.php/5823/pharo0.1-10062dev08.09.1.zip",
10061 => "https://gforge.inria.fr/frs/download.php/5624/pharo0.1-10061dev08.08.2.zip",
10050 => "https://gforge.inria.fr/frs/download.php/5551/pharo0.1-10050dev08.08.1.zip",
10046 => "https://gforge.inria.fr/frs/download.php/5303/pharo0.1-10046dev08.07.1.zip",
10041 => "https://gforge.inria.fr/frs/download.php/5069/pharo0.1-10041dev08.06.3.zip",
10036 => "https://gforge.inria.fr/frs/download.php/4978/pharo0.1-10036dev08.06.2.zip",
10032 => "https://gforge.inria.fr/frs/download.php/4869/pharo0.1-10032-7075dev08.06.1.zip",
10028 => "https://gforge.inria.fr/frs/download.php/4795/pharo0.1-10028dev08.05.1.zip"

}

# find the last version =======================================================
versionFile = nil
versionNumber = 0
PHARO_VERSION.downto(10000) {|i|
    versionNumber = i
    if versions.has_key? i
        versionFile = versions[i]
        break
    end
}

# ==============================================================================
puts blue("Using pharo version #{versionNumber} as base image")

downloadZip = "pharo#{versionNumber}.zip"

`#{DIR}/../download.sh #{downloadZip} #{versionFile}`
`unzip -o #{downloadZip}`
# Potentially dangerous as it might not match the proper images..
`mv **/*.image Pharo-#{PHARO_VERSION}.image`
`mv **/*.changes Pharo-#{PHARO_VERSION}.changes`
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

`$PHARO_VM -headless $PWD/Pharo-#{PHARO_VERSION}.image $PWD/updateTo#{PHARO_VERSION}.st`

`rm $PWD/updateTo#{PHARO_VERSION}.st`
