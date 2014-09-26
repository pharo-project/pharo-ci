private executing
runCommandWaitForAnswer: aString 
	| delay command |
	command := OSProcess command: aString, ' >>', self logFileReference fullName, ' 2>&1'.
	delay := 50 milliSeconds asDelay.
	[ command isComplete ] whileFalse: [ delay wait ].
	command succeeded ifFalse: [ 
		Error signal: 'Error while executing external command: ', command exitStatus printString ]