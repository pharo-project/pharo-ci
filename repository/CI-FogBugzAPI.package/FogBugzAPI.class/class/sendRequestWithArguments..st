private
sendRequestWithArguments: arguments
 	
	^ self sendRequestWithArguments: arguments ifError: [ self error: 'bal' ].