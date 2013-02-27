protocol
logOff

	self sendRequestWithArguments: (Dictionary new
											at: 'cmd' put: 'logoff';
											yourself)