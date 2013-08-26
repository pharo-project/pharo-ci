copying
postCopy
	super postCopy.
	errors := errors copy.
	warnings := warnings copy.
	messages := messages copy.