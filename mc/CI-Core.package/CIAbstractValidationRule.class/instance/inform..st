ui
inform: aString
	self flag: 'for debugging'.
	VTermOutputDriver stdout
			nextPutAll: 'Notice: ';
			nextPutAll: aString asString; lf.