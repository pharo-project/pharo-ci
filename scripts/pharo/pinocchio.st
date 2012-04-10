Author fullName: 'Pinocchio Installation'.

"install pinocchio ============================================================"
Gofer new url: 'http://ss3.gemstone.com/ss/p';
    package: 'ConfigurationOfPinocchio';
    load.

(Smalltalk at: #ConfigurationOfPinocchio) perform: #loadDevelopment.

"install o-completion ========================================================"
Gofer new
    squeaksource: 'MetacelloRepository';
    package: 'ConfigurationOfOCompletion';
    load.

(Smalltalk at: #ConfigurationOfOCompletion) perform: #loadStable.

"install git-support ========================================================="
Gofer new
    url: 'http://ss3.gemstone.com/ss/fs-git';
    package: 'ConfigurationOfFSGit';
    load.

(Smalltalk at: #ConfigurationOfFSGit)  perform: #loadDevelopment.

"install os-process =========================================================="
Gofer new
    squeaksource: 'MetacelloRepository';
    package: 'ConfigurationOfOSProcess';
    load.

(Smalltalk at: #ConfigurationOfOSProcess) perform: #load.

"Fetch the latest sources from our git repository ============================"
"c-code"
OSProcess waitForCommand: 'git clone git://github.com/pinocchio/p.git'.
OSProcess waitForCommand: 'git --git-dir="p" remote add origin git@github.com:pinocchio/p.git'.
OSProcess waitForCommand: 'git --git-dir="p" branch --set-upstream master origin/master'.

"st-code"
OSProcess waitForCommand: 'git clone git://github.com/pinocchio/p-st.git'.
OSProcess waitForCommand: 'git --git-dir="p-st" remote add origin git@github.com:pinocchio/p-st.git'.
OSProcess waitForCommand: 'git --git-dir="p-st" branch --set-upstream master origin/master'.

"create a working copy for the pinocchio git repos"
wc := (MCPackage named: 'Pinocchio') workingCopy.
wc repositoryGroup addRepository:( MCOSGitRepository 
            directory: 'p-st'
            remote: 'git@github.com:pinocchio/p-st.git' 
            push: true).

"add all subpackages of P4 to the working copy"
wc requirePackage: (MCPackage named: 'P4').
(RPackage named: 'P4') systemSubPackages do: [ :p| 
    wc requirePackage: (MCPackage named: p name) ].

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

Author reset.
