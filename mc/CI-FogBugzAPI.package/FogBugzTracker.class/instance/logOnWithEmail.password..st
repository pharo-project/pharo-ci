logging
logOnWithEmail: emailAddress password: password
	| arguments response token |

	arguments := Dictionary new 
					at: 'cmd' put: 'logon';
					at: 'email' put: emailAddress;
					at: 'password' put: password;
					yourself.
					
	response := self sendRequestWithArguments: arguments ifError: [ :message |
			FogBugzIdentificationError signal: message ].
		
	token := self class extractTokenFrom: response.
	^ self identifyingToken: token.