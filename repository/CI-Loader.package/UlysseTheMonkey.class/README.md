An UlysseTheMonkey is an intergalactikal monkey here on earth to validate or meanly reject bug fixes form the pharo google issue tracker.

Ulysse takes an issue using the following rules: 
	- the issue has to be flagged "Milestone-#{currentVersionOfPharo}"
	- the issue has to be flagged FixReviewNeeded or to already have been checked but in a previous update of Pharo.

Then Ulysse run the tests once, load the fix (as a cs or a slice), and run the tests another time.


If an error occurs during:
	- the retrieving of the fix, the issue is flagged NoSourceAvailable
	- the load, the issue is flagged WorkNeeded
	- the test run, the issue is flagged TestFailing
	
Otherwise, the issue is flagged ValidateByTheMonkey, and a label is added with the current Pharo update.