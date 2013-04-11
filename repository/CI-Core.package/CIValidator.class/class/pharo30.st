instance creation
pharo30
	| validator |
	validator := self new.
	validator addRule: CIRunAllTestsRule.
	^ validator