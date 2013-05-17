initialization
initialize
	super initialize.
	imageForker := CIImageForker new.
	imageForker timeout: self timeout.