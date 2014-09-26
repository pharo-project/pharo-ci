private
configurationsAsArray
	^ (self issues select: #isMetacello)
		collect: [ :each | each configurationName -> each version ]
		as: Array