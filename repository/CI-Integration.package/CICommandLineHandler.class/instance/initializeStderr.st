initialize-release
initializeStderr
	super initializeStderr.
	stderr := VTermOutputDriver on: stderr.