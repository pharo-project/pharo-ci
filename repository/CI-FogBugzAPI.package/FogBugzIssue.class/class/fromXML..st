instance creation
fromXML: xml
	| instance |

	instance := self new 
					fromXML: xml;
					yourself.
	self issues add: instance.

	^ instance