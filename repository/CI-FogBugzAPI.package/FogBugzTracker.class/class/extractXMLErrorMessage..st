private
extractXMLErrorMessage: aResponse
	^ ((XMLDOMParser parse: aResponse) findElementNamed: 'error') contentString