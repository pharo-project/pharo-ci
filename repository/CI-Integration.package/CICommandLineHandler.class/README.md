Usage: ci [issues] [load|test [--issue=<issueNumber>] [--update-issue]]

	issues          list all open issues
	load            install the given or next open issue
	test            test the given or next open issue
	
	--issue         specifiy an issue to be tested if omitted use the next untested issue
	<issueNumber>      a valid Issue number from the Pharo issue tracker
	--update-issue     if specified updates the issue with integration information
	
Documentation:
The CI command line handler interacts with the issue tracker and loads and tests submitted code.

