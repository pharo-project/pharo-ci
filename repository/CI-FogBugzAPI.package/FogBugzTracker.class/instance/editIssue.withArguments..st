protocol-edition
editIssue: id withArguments: arguments
	| response |

	arguments 	
		at: 'cmd' put: 'edit';
		at: 'ixBug' put: id asString.

	response := self sendRequestWithArguments:arguments.
	self flag: 'analyse response for error'