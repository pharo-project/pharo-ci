image forking
serializeGlobals: globals result: result
	| serializer |
	
	serializer := FLSerializer newDefault.
	serializer analyzer considerInternalAllBehaviors: globals.
	serializer
		serialize: { globals. result }
		on: self tempFile writeStream binary