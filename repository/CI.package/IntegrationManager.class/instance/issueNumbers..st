accessing
issueNumbers: aCollection

	| issues |
	issues := aCollection collect: [:each | self tracker issue: each asNumber ]. 
	issuesToIntegrate := issues.