I am in charge of loading an issue for my tracker and then provide it to the validator, and finally update the tracker according to the validator result.

My scenario is:
	1) log on to the tracker
	2) fetch the next interesting issue, the logic of which one is interesting or not depends on me only. The tracker should not know about this at all
	3) load latest slice (yes, we drop cs files)
	4) provide it to the validator
	5) get results from the validator
	6) update the issue
	7) log off and let another instance do the next issue