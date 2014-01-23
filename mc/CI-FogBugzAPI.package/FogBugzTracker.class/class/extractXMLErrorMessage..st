private
extractXMLErrorMessage: aResponse
	^ ((Soup fromString: aResponse) findTag: 'error') string