protocol
loadSlice
	"load the slice for the set issue"
	
	[ self issue slice load ]
		on: Exception
		do: [ :e| self addError: e forFile: (self issue slice name, ' from ', self repository description)].
		
	extraTests addAll: self impactedPackagesTests.