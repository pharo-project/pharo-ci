protocol
editIssue: id withArguments: arguments
	| respons |

	arguments 	
		at: 'cmd' put: 'edit';
		at: 'ixBug' put: id asString.

	respons := self sendRequestWithArguments:arguments.