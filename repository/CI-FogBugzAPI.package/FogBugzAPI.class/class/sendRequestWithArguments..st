private
sendRequestWithArguments: arguments
	| event groupOf lastIndex text |
	
	event := arguments at: 'sEvent' ifAbsent: ''.	
	groupOf := 750.
	
	event groupsOf: groupOf atATimeDo: [:collection |
		text := String streamContents: [:s | collection do: [:c | s nextPut: c ]].
		arguments at: 'sEvent' put: text.
		self sendRequestWithArguments: arguments ifError: [ self error: 'bal' ]].
	
	lastIndex := (event size // groupOf) * groupOf.
	text := event copyFrom: lastIndex +1 to: event size.
	arguments at: 'sEvent' put: text.
	
	^ self sendRequestWithArguments: arguments ifError: [ self error: 'bal' ]