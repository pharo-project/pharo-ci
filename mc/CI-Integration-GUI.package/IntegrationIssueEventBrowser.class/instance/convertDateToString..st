private
convertDateToString: aDateAndTime 
	^ String streamContents: [ :stream | 
		aDateAndTime printYMDOn: stream.
		stream space.
		aDateAndTime printHMSOn: stream ]