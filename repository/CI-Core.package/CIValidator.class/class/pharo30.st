instance creation
pharo30
	| validator |
	validator := self new.
	validator addRule: CITestRunner "CIRunAllTestsRule".
	^ validator