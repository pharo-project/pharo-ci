initialization
initialize
	super initialize.
	self flag: 'should be removed when using ImageWorker'.
	imageForker := CIImageForker new.
	imageForker timeout: self timeout.