private
forkImage
	self updateSession.
	"Trying to avoid running any commandline handlers when running the forked image"
	Smalltalk backupTo: name.
	VTermOutputDriver stdout red: Smalltalk imageName; lf.
 