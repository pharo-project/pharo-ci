| color red green blue white white_nolf
  updateSelector commitMessage versionString fileTreeRepository packages
  mainRepos inboxRepos commit |

"============================================================================="
Author fullName: 'Mister Foo'.
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

red        := [:text| color value: 31 value: text ].
green      := [:text| color value: 32 value: text ].
blue       := [:text| color value: 34 value: text ].
white      := [:text| FileStream stderr nextPutAll: text; crlf ].
white_nolf := [:text| FileStream stderr nextPutAll: text ].

"============================================================================="

Deprecation  raiseWarning: false.

"keep track of the current mc packages ======================================="
blue value:'Tracking the currently installed packages'.

mainRepos := MCRepositoryGroup default repositories detect: [ :repos|
	repos asString includesSubString: 'http://ss3.gemstone.com/ss/Pharo20'].
inboxRepos := MCRepositoryGroup default repositories detect: [ :repos|
	repos asString includesSubString: 'PharoInbox'].


packages := MCWorkingCopy allInstances 
    select: [ :wc|
        "remove the inbox from all working copies to speed up comitting"
        wc repositoryGroup removeRepository: inboxRepos.
	    "check if the package is in pharo core"
        wc repositoryGroup repositories anySatisfy: [ :r| r = mainRepos ]]
    thenCollect: [ :wc| wc package name ].

" load filetree =============================================================="
blue value:'Installing FileTree'.

"Preload Metacello due to some issue in the 20200 branch"
"
[ Gofer it
        url: 'http://seaside.gemstone.com/ss/metacello';
        package: 'ConfigurationOfMetacello';
        load.
(Smalltalk at: #ConfigurationOfMetacello) project stableVersion load: 'batch'. 
Compiler recompileAll.
] on: Error do: [ :f| ].

[ Gofer it
        url: 'http://seaside.gemstone.com/ss/metacello';
        package: 'ConfigurationOfMetacello';
        load.
(Smalltalk at: #ConfigurationOfMetacello) project stableVersion load: 'batch'.
Compiler recompileAll.
] on: Error do: [ :f| ]."

Gofer new
      url: 'http://ss3.gemstone.com/ss/FileTree';
      package: 'ConfigurationOfFileTree';
      load.
    ((Smalltalk at: #ConfigurationOfFileTree) project version: #'stable') load.
"
Gofer new
    url: 'http://smalltalkhub.com/mc/Pharo/ci/main'
    package: 'filetree';
    load."
"Compiler recompileAll."

" create a new filetree repository ==========================================="
blue value: 'Preparing commit'.
fileTreeRepository := (Smalltalk at: #MCFileTreeRepository) new directory: 'pharo-core' asFileReference.

" extra the commit message from the current version ========================="
versionString  := SystemVersion current highestUpdate asString.
updateSelector := ('update', versionString) asSymbol.
commitMessage  := ScriptLoader methodDict 
                        at: updateSelector
                        ifPresent: [ :method|
                            (method allLiterals select: [ :each| 
                                each isKindOf: ByteString ]) first]
                        ifAbsent: [ '' "for some strange reason some updates do not contain an explicit update"].

"save all packages into the filetree repository ============================="
blue value:'Comitting changes to ', fileTreeRepository directory asString.


"manually commit since Gofer gives birth incredible shitty pink ponies on the way"
commit := [ :packageName| | version |
	  version := [ (MCPackage named: packageName) workingCopy newVersion ]
		    on: MCVersionNameAndMessageRequest
		    do: [ :notification |
			      notification resume: { notification suggestedName. commitMessage }].
	  fileTreeRepository storeVersion: version ].

mainRepos cacheAllFileNamesDuring: [
inboxRepos cacheAllFileNamesDuring: [
    packages do: [ :packageName| |message|
        white_nolf value: (message := '    Exporting ', packageName, ' ... ').
        (50 - message size) timesRepeat: [ white_nolf value: ' ']. 
        white value: 'Done in ', (Duration milliSeconds: [ 
                commit value: packageName
            ] timeToRun) asString ]]].

"output the current version number =========================================="
(FileStream forceNewFileNamed: 'version')
    nextPutAll: versionString;
    close.
"store the commit message in a separate file"
(FileStream forceNewFileNamed: versionString)
    lineEndConvention: #lf;
    nextPutAll: versionString; lf;
    nextPutAll: commitMessage; lf;
    close.

FileStream stdout
    nextPutAll: versionString.

" and we're done ============================================================"
Smalltalk snapshot: false andQuit: true.
