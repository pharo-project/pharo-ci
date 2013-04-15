private
loadSerializer
	"create a special serializer that uses only ignore the current globals.
	Usually this validation rule will load a change and thus introduce new globals
	which by default are ignored by the serializer. However since we analyze the results
	of this validation in an image that does not have the same changes applied, we
	have to serialize all new globals too."
	serializer := FLSerializer newDefault.
	"freeze the current environment and thus serialize all new classes"
	serializer analyzer globalEnvironment: self class environment copy.
	^ serializer