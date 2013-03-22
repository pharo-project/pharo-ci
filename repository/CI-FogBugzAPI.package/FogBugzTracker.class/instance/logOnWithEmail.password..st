protocol-log on/off
logOnWithEmail: emailAddress password: password
	| arguments respons token |

	arguments := Dictionary new 
					at: 'cmd' put: 'logon';
					at: 'email' put: emailAddress;
					at: 'password' put: password;
					yourself.
					
	respons := self sendRequestWithArguments: arguments.
	(respons includesSubstring: '</error>')
		ifTrue: [ (FogBugzIdentificationError response: respons) signal ].
		
	token := self class extractTokenFrom: respons.
	^ self identifyingToken: token.