private
forkImage
	self updateSession.
	"Trying to avoid running any commandline handlers when running the forked image"
	[
		Smalltalk removeFromStartUpList: BasicCommandLineHandler.
		Smalltalk backupTo: name.
 	] ensure: [ BasicCommandLineHandler initialize ].