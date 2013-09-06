private
forkImage
	self updateSession.
	"Trying to avoid running any commandline handlers when running the forked image"
	[
		WorldState deferredUIMessages flush.
		Smalltalk removeFromStartUpList: BasicCommandLineHandler.
		Smalltalk backupTo: name.
		VTermOutputDriver stdout red: Smalltalk imageName; lf.
 	] ensure: [ BasicCommandLineHandler initialize ].