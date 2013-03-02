private
sendRequestWithArguments: arguments
	| event lastIndex text |
	event := arguments at: 'sEvent' ifAbsent: ''.	
	
	event groupsOf: 1000 atATimeDo: [:collection |
		text := String streamContents: [:s | collection do: [:c | s nextPut: c ]].
		arguments at: 'sEvent' put: text.
		self sendRequestWithArguments: arguments ifError: [ self error: 'bal' ]].
	
	lastIndex := (event size // 1000) * 1000.
	text := event copyFrom: lastIndex +1 to: event size.
	arguments at: 'sEvent' put: text.
	
	^ self sendRequestWithArguments: arguments ifError: [ self error: 'bal' ]