protocol-log on/off
logOff

	self sendRequestWithArguments: (Dictionary new
											at: 'cmd' put: 'logoff';
											yourself)