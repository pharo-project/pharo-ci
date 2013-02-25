instance creation
email: emailAddress password: password
	| arguments respons token |

	arguments := Dictionary new 
					at: 'cmd' put: 'logon';
					at: 'email' put: emailAddress;
					at: 'password' put: password;
					yourself.
					
	respons := self sendRequestWithArguments: arguments.
	(respons includesSubstring: '</error>')
		ifTrue: [ (IdentificationError respons: respons) signal ].
		
	token := self extractTokenFrom: respons.
	^ self identifyingToken: token.