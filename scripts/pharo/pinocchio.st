Author fullName: 'Pinocchio Installation'.

"============================================================================="
"some helper blocks for error printing"
color := [:colorCode :text|
    FileStream stderr 
        "set the color"
        nextPut: Character escape; nextPut: $[; print: colorCode; nextPut: $m;
        nextPutAll: text; crlf;
        "reset the color"
        nextPut: Character escape; nextPutAll: '[0m'.
].

red := [:text| color value: 31 value: text ].
green := [:text| color value: 32 value: text ].
yellow := [:text| color value: 33 value: text ].
white := [:text| FileStream stderr nextPutAll: text; crlf ].

"install pinocchio ============================================================"
yellow value: 'Installing Pinocchio'.
Gofer new url: 'http://smalltalkhub.com/mc/dh83/p/main';
    package: 'ConfigurationOfPinocchio';
    load.

(Smalltalk at: #ConfigurationOfPinocchio) perform: #loadDevelopment.

"install o-completion ========================================================"
(SystemVersion current major >= 2) 
    ifFalse: [
        yellow value: 'Installing O-Completion'.
        Gofer new
            squeaksource: 'MetacelloRepository';
            package: 'ConfigurationOfOCompletion';
            load.
        
        (Smalltalk at: #ConfigurationOfOCompletion) perform: #loadStable ].

"install git-support ========================================================="
yellow value: 'Installing Git-Support'.
Gofer new
    url: 'http://ss3.gemstone.com/ss/fs-git';
    package: 'ConfigurationOfFSGit';
    load.

(Smalltalk at: #ConfigurationOfFSGit)  perform: #loadDevelopment.

"install os-process =========================================================="
yellow value: 'Installing OS-Process'.
Gofer new
    squeaksource: 'MetacelloRepository';
    package: 'ConfigurationOfOSProcess';
    load.

(Smalltalk at: #ConfigurationOfOSProcess) perform: #load.

"Fetch the latest sources from our git repository ============================"
"c-code"
yellow value: 'Loading Git Repositories'.
OSProcess waitForCommand: 'git clone git://github.com/pinocchio/p.git'.
OSProcess waitForCommand: 'git --git-dir="p" remote add origin git@github.com:pinocchio/p.git'.
OSProcess waitForCommand: 'git --git-dir="p" branch --set-upstream master origin/master'.

"st-code"
[
    OSProcess waitForCommand: 'git clone git://github.com/pinocchio/p-st.git'.
    OSProcess waitForCommand: 'git --git-dir="p-st" remote add origin git@github.com:pinocchio/p-st.git'.
    OSProcess waitForCommand: 'git --git-dir="p-st" branch --set-upstream master origin/master'.
] "value".

"create a working copy for the pinocchio git repos"
wc := (MCPackage named: 'Pinocchio') workingCopy.
wc repositoryGroup repositories allButFirst do: [ :r| 
    wc repositoryGroup removeRepository: r ].

wc repositoryGroup
    addRepository: (repos := MCHttpRepository
	    location: 'http://smalltalkhub.com/mc/dh83/p/main'
        user: ''
        password: '').

"wc repositoryGroup addRepository:( MCOSGitRepository 
            directory: 'p-st'
            remote: 'git@github.com:pinocchio/p-st.git' 
            push: true)."

"add all subpackages of P4 to the working copy"
(RPackage named: 'P4') systemSubPackages do: [ :p| | packageName package repositoryGroup | 
    "only include up to two sublevels"
    packageName := $- join: (( $- split: p name) first: 2).
    wc requirePackage: (package := MCPackage named: packageName).
    repositoryGroup := package workingCopy repositoryGroup.
	repositoryGroup repositories allButFirst do: [:r|  repositoryGroup removeRepository: r ].
    repositoryGroup addRepository: repos ].

"Settings ===================================================================="
"create a workspace with the default export settings"
Workspace openContents: '"Default Exporting of Kernel Tests ============================"
"Linux"
P4StaticClassInstaller exportKernelTestLinux64.

"Mac OS X"
P4StaticClassInstaller exportKernelTestOSX64.

"Customized ==================================================="
P4StaticClassInstaller osx64 "linux64"
    compileClasses: '.

"pinpoint workspace"
(Workspace new openLabel: '')
	width: 1200; height: 230;
	setToAdhereToEdge: #bottomLeft;
	makeUnclosable.

"pinpoint a mc working copy browser"
MCWorkingCopyBrowser new show window
	width: 700; height: 230;
	setToAdhereToEdge: #topLeft;
	makeUnclosable.

"some default settings"
Debugger alwaysOpenFullDebugger: true.
World submorphs do: [:each | each delete ].
PolymorphSystemSettings 
	desktopColor: Color gray;
	showDesktopLogo: false.
TextEditorDialogWindow autoAccept: true.

"CLEANUP ======================================================================"
Author reset.
