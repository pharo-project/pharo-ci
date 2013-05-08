copying
postCopy
	super postCopy.
	failures := failures copy.
	warnings := warnings copy.
	messages := messages copy.