as yet unclassified
publisher

	| multiplePublisher |
	multiplePublisher := CIComposedPublisher manager: self manager.
	multiplePublisher addPublisher: CICommandLinePublisher .
	multiplePublisher addPublisher: CIHTMLPublisher .
	multiplePublisher addPublisher: CIXMLPublisher .
	
	^ multiplePublisher  