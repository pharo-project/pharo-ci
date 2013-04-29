image forking
publishResult: aBlock
	| globals result serializer |
	
	
	globals := Smalltalk globals asSet.
	result := aBlock value.
	globals := (Smalltalk globals asSet \ globals) select: [ :each | each isBehavior ].
	
	serializer := FLSerializer newDefault.
	serializer analyzer considerInternalAllBehaviors: globals.
	serializer
		serialize: { globals. result } 
		on: self tempFile writeStream binary