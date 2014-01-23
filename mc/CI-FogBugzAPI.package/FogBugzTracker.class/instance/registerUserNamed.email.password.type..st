protocol-users
registerUserNamed: fullName email: email password: password type: type

	^ self sendRequestWithArguments: (Dictionary new
											at: 'cmd' put: 'newPerson';
											at: 'sEmail' put: email;
											at:'sFullname' put: fullName;
											at: 'sPassword' put: password;
											at: 'nType' put: '0';
											yourself)