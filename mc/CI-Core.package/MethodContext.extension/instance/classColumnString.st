*CI-Core
classColumnString
	| classLocation receiverClass |
	
	classLocation := self home method methodClass.
	receiverClass := self receiver class.
	
	"If the receiver is differen from the implementor, show the original method implementor"
	classLocation = receiverClass
		ifTrue: [ classLocation := classLocation name ]
		ifFalse: [ 
			classLocation := receiverClass name, '(', classLocation name, ')' ].
	
	self isBlockContext
		ifTrue: [ ^ '[...] in ', classLocation ].
		
	^ classLocation