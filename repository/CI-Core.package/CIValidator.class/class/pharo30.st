instance creation
pharo30
	"add CIAbstractValidationRule allSubclasses dans les Rule"
	| validator |
	validator := self new.
	validator addRule: CIRunTestsRule.
	^ validator