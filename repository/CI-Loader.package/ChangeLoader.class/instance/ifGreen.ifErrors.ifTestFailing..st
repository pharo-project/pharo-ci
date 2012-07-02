private
ifGreen: greenBlock ifErrors: errorBlock ifTestFailing: testBlock

	self isGreen ifTrue: [ ^ greenBlock value ].

	^ errors isEmpty
		ifTrue: testBlock 
		ifFalse: errorBlock 