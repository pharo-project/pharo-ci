instance creation
fromXML: xml
	| instance |
	
	instance := self id: (xml findTag: 'ixproject') next asString asInteger.
	instance fromXML: xml.
	self projects add: instance.
	^ instance