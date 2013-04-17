instance creation
configurationTest
	"add CIAbstractValidationRule allSubclasses dans les Rule"
	| validator |
	validator := self new.
	validator addRule: CIRunConfigTestsRule"add a specific runtTest for config".
	^ validator