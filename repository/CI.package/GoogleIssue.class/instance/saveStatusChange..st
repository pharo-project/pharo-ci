integration-private
saveStatusChange: aMessageString

	"this is the cleanes solution we came up with :)"
	
	^ self postXML: (self statusUpdateXML: aMessageString)