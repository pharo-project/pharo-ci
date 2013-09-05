initialize
initialize

	super initialize.
	name := Smalltalk imageFile nextVersion basenameWithoutExtension,'-', Time primUTCMicrosecondsClock asString.
	timeout := 20 minutes.