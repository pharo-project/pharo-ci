editing
closeIssue: id
	| arguments response |

	
	arguments := Dictionary new
		at: 'cmd' put: 'close';
		at: 'ixBug' put: id asString;
		yourself.

	response := self sendRequestWithArguments: arguments.
	self flag: 'analyse response for error'.
	^ response