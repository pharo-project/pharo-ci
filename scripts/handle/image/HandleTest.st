"Load Hudson Build Tools"
Gofer new
	renggli: 'hudson';
	package: 'HudsonBuildTools';
	load.
	
"Run Pier 2 Tests"
HDTestReport runPackages: #(Handles-Tests-Kernel).

(Smalltalk saveAs: 'AfterTests.image') 
	ifFalse: [ Smalltalk snapshot: false andQuit: true ].
