private
loadSlice
	"load the slice for the set issue"
	
	self flag: 'TODO: record the adds/changes/removes per package'.
	
	[ self slice load ]
		on: Error, Warning
		do: [ :e| 
			self addError: e forFile: (self slice name, ' from ', self slice repository description)].