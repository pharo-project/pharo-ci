Usage: ci [config | slice ] [[list] [load|test [--issue=<issueNumber>][--next] [--update-issue]]] | [ --url="anURL" --config="ConfigurationOf" ]

	list           	list all open issues
	load            install the given or next open issue
	test            test the given or next open issue
	
	--issue         		specifiy an issue to be tested if omitted use the next untested issue
	<issueNumber>      a valid Issue number from the Pharo issue tracker
	--next          		use the next open issue for the selected action
	--update-issue     	if specified updates the issue with integration information
	
	--url          			describe the repository where the ConfigurationOf is
	--update-issue     	describe wich ConfigurationOf we want to load and test
	
Documentation:
The CI command line handler interacts with the issue tracker, loads slice or configuration and tests submitted code.
