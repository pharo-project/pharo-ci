private - forked image
runSafely: aBlock
	self inform: 'runSafely:'.
	"Make sure we can run aBlock without side-effects "
	[ aBlock ensure: [
		"Make sure that we always quit the image after running the block and serializing its contents."
		Smalltalk exitSuccess.
		Error signal: 'Do not reopen a forked image' ]
	] fork.
	"We have to make sure to block the current process to avoid side-effects"
	self terminateActiveProcess.