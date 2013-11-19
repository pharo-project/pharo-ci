Usage: ci [config | slice ] [[list] [load|test [--issue=<issueNumber>][--next] [--update-issue]]] | [ anURL aConfigurationOf ] [ --html-resources=<URL> ]

Slice part:

	list 	list all open issues
	load 	install the given or next open issue
	test 	test the given or next open issue
	
	--issue            specifiy an issue to be tested if omitted use the next untested issue
	<issueNumber>      a valid Issue number from the Pharo issue tracker / next
	--next             use the next open issue for the selected action
	--update-issue     if specified updates the issue with integration information
	--html-resources   specify a url for the resources used in the html exporter
		
Configuration part:

	url                 describe the repository where the ConfigurationOf is
	aConfigurationOf    describe wich ConfigurationOf we want to load and test
		
	--version           specify a version to be tested 
	<versionDescripter> a valid version descripter, it can be a numeric version 
	                    like "1.02" or #stable, #development ...
	--group             specify wich packages you want to load from the ConfigurationOf	
	<groupList>         a valid list of packages.
	
Documentation:
	The CI command line handler interacts with the issue tracker, loads slice or configuration and tests submitted code.

Examples: 
	# validate an issue locally
   ./pharo Pharo.image ci slice test --issue=0000
	
   # valiate the next Fix to Review issue
   ./pharo Pharo.image ci slice test --next