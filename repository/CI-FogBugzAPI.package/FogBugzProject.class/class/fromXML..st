instance creation
fromXML: xml
	| instance |
	
	instance := self id: (xml findTag: 'ixproject') next asString asInteger.
	instance fromXML: xml.
	^ instance