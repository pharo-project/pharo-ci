ui
inform: aString
	self flag: 'for debugging'.
	VTermOutputDriver stderr
			nextPutAll: 'Notice: ';
			nextPutAll: aString asString; lf.