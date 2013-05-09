private
validateXML: response ifError: aBlock
	"Manually check if the response contains an error message from fogbugz.
	Most probably this is a bug since the http response is not flagged as an error"
	
	(response endsWith: ']]></error></response>')
		ifTrue: [ aBlock cull: (self extractXMLErrorMessage: response) ]