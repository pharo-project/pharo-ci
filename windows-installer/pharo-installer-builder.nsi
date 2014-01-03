!define APPNAME "Pharo"
!define DESCRIPTION "The ultimate live-programming environment"
!define VERSIONMAJOR 3
!define VERSIONMINOR 0
!define VERSIONBUILD 20131220

# These will be displayed by the "Click here for support information" link in "Add/Remove Programs"
# It is possible to use "mailto:" links in here to open the email client
!define HELPURL "mailto://damien.cassou@gmail.com" # "Support Information" link
!define UPDATEURL "http://pharo.org" # "Product Updates" link
!define ABOUTURL "http://pharo.org" # "Publisher" link

# This is the size (in kB) of all the files copied into "Program Files"
!define INSTALLSIZE 105580

RequestExecutionLevel admin ;Require admin rights on NT6+ (When UAC is turned on)

InstallDir "$PROGRAMFILES\${APPNAME}"

# rtf or txt file - remember if it is txt, it must be in the DOS text format (\r\n)
# LicenseData "license.rtf"

Name "${APPNAME}"
Icon "pharo.ico"
outfile "pharo_installer.exe"

!include LogicLib.nsh
 
# Just three pages - license agreement, install location, and installation
# page license
page directory
Page instfiles

!macro VerifyUserIsAdmin
UserInfo::GetAccountType
pop $0
${If} $0 != "admin" ;Require admin rights on NT4+
        messageBox mb_iconstop "Administrator rights required!"
        setErrorLevel 740 ;ERROR_ELEVATION_REQUIRED
        quit
${EndIf}
!macroend
 
function .onInit
	setShellVarContext all
	!insertmacro VerifyUserIsAdmin
functionEnd

section "install"
	# Files for the install directory - to build the installer, these should be in the same directory as the install script (this file)
	setOutPath $INSTDIR
	# Files added here should be removed by the uninstaller (see section "uninstall")
	file Pharo-win\Pharo\FT2Plugin.dll
	file Pharo-win\Pharo\libcairo-2.dll
	file Pharo-win\Pharo\libeay32.dll
	file Pharo-win\Pharo\libfreetype-6.dll
	file Pharo-win\Pharo\libpixman-1-0.dll
	file Pharo-win\Pharo\libpng-3.dll
	file Pharo-win\Pharo\Pharo.changes
	file Pharo-win\Pharo\Pharo.exe
	file pharo.ico
	file Pharo-win\Pharo\Pharo.image
	file Pharo-win\Pharo\Pharo.ini
	file Pharo-win\Pharo\PharoV10.sources
	file Pharo-win\Pharo\PharoV20.sources
	file Pharo-win\Pharo\README.txt
	file Pharo-win\Pharo\SqueakFFIPrims.dll
	file Pharo-win\Pharo\SqueakSSL.dll
	file Pharo-win\Pharo\ssleay32.dll
	file Pharo-win\Pharo\zlib1.dll
 
	# Uninstaller - See function un.onInit and section "uninstall" for configuration
	writeUninstaller "$INSTDIR\uninstall.exe"
 
	# Start Menu
	createDirectory "$SMPROGRAMS\${APPNAME}"
	createShortCut "$SMPROGRAMS\${APPNAME}\${APPNAME}.lnk" "$INSTDIR\pharo.exe" "" "$INSTDIR\pharo.ico"
 
	# Registry information for add/remove programs
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}" "DisplayName" "${APPNAME} - ${DESCRIPTION}"
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}" "UninstallString" "$\"$INSTDIR\uninstall.exe$\""
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}" "QuietUninstallString" "$\"$INSTDIR\uninstall.exe$\" /S"
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}" "InstallLocation" "$\"$INSTDIR$\""
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}" "DisplayIcon" "$\"$INSTDIR\pharo.ico$\""
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}" "Publisher" "$\"${APPNAME}$\""
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}" "HelpLink" "$\"${HELPURL}$\""
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}" "URLUpdateInfo" "$\"${UPDATEURL}$\""
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}" "URLInfoAbout" "$\"${ABOUTURL}$\""
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}" "DisplayVersion" "$\"${VERSIONMAJOR}.${VERSIONMINOR}.${VERSIONBUILD}$\""
	WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}" "VersionMajor" ${VERSIONMAJOR}
	WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}" "VersionMinor" ${VERSIONMINOR}
	# There is no option for modifying or repairing the install
	WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}" "NoModify" 1
	WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}" "NoRepair" 1
	# Set the INSTALLSIZE constant (!defined at the top of this script) so Add/Remove Programs can accurately report the size
	WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}" "EstimatedSize" ${INSTALLSIZE}
sectionEnd

# Uninstaller
 
function un.onInit
	SetShellVarContext all
 
	#Verify the uninstaller - last chance to back out
	MessageBox MB_OKCANCEL "Permanantly remove ${APPNAME}?" IDOK next
		Abort
	next:
	!insertmacro VerifyUserIsAdmin
functionEnd
 
section "uninstall"
 
	# Remove Start Menu launcher
	delete "$SMPROGRAMS\${APPNAME}\${APPNAME}.lnk"
	# Try to remove the Start Menu folder - this will only happen if it is empty
	rmDir "$SMPROGRAMS\${APPNAME}"
 
	delete $INSTDIR\FT2Plugin.dll
	delete $INSTDIR\libcairo-2.dll
	delete $INSTDIR\libeay32.dll
	delete $INSTDIR\libfreetype-6.dll
	delete $INSTDIR\libpixman-1-0.dll
	delete $INSTDIR\libpng-3.dll
	delete $INSTDIR\Pharo.changes
	delete $INSTDIR\Pharo.exe
	delete $INSTDIR\pharo.ico
	delete $INSTDIR\Pharo.image
	delete $INSTDIR\Pharo.ini
	delete $INSTDIR\PharoV10.sources
	delete $INSTDIR\PharoV20.sources
	delete $INSTDIR\README.txt
	delete $INSTDIR\SqueakFFIPrims.dll
	delete $INSTDIR\SqueakSSL.dll
	delete $INSTDIR\ssleay32.dll
	delete $INSTDIR\zlib1.dll
 
	# Always delete uninstaller as the last action
	delete $INSTDIR\uninstall.exe
 
	# Try to remove the install directory - this will only happen if it is empty
	rmDir $INSTDIR
 
	# Remove uninstaller information from the registry
	DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}"
sectionEnd