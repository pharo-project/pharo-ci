initialization
initialize
	super initialize.
	imageForker := ImageForker new.
	imageForker timeout: self timeout.