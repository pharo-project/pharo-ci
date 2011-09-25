protocol
loadSlice
	"load the slice for the set issue"
	
	[ self slice load ]
		on: Exception
		do: [ :e| self addError: e forFile: (self slice name, ' from ', self slice repository description)].
		
	extraTests addAll: self impactedPackagesTests.