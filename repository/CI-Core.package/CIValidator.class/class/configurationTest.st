instance creation
configurationTest
	"add CIAbstractValidationRule allSubclasses dans les Rule"
	| validator |
	validator := self new."
	validator addRule: CIRunConfigTestsRule."
	validator addRule: CIClassCommentRule."
	validator addRule: CIUncategorizedMethodRule.
	validator addRule: CICodeCriticsRule ".
	^ validator