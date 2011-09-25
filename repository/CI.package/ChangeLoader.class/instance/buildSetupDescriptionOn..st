printing
buildSetupDescriptionOn: aStream
	
	aStream << '----------------------------------------------------------'; lf.
	aStream << 'Loaded Source: '.
	
	self issue hasSlice 
		ifTrue: [ aStream << self slice name << ' from ' << self slice repository description ].
		
	self issue hasChangeSet
		ifTrue: [
			self issue changeSets size > 1 ifTrue: [ aStream lf tab ].
			self issue changeSets 
					do: [ :attachment|  aStream << attachment description ]
					separatedBy: [ aStream lf tab ]].
		
	aStream lf.
	aStream << 'Tested using ' << SystemVersion current imageVersionString.
	aStream << ' on ' << Smalltalk vm version