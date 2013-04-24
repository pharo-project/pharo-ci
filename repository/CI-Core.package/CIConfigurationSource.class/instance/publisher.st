accessing
publisher

	| multiplePublisher |
	multiplePublisher := CIComposedPublisher manager: self manager.
	multiplePublisher add: CICommandLinePublisher .
	multiplePublisher add: CIHTMLPublisher .
	multiplePublisher add: CIXMLPublisher .
	
	^ multiplePublisher  