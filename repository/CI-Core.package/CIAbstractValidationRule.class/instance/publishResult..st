image forking
publishResult: aBlock
	| globals result serializer |
	globals := Smalltalk globals copy.
	result := aBlock value.
	
	serializer := FLSerializer newDefault.
	
	globals := (Smalltalk globals \ globals ) values select: [ :each| each isBehavior ].
	
	serializer analyzer considerInternalAllBehaviors: globals.
	serializer
		serialize: { globals. result } 
		on: FileStream stdout binary