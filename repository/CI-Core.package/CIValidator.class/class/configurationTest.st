instance creation
configurationTest
	"add CIAbstractValidationRule allSubclasses dans les Rule"
	| validator rule |
	validator := self new.
	rule := CIAndRule with: CIRunConfigTestsRule with: CIClassCommentRule.
	rule andWith: CIUncategorizedMethodRule.
	validator addRule: rule.
	"
	validator addRule: CIRunConfigTestsRule.
	validator addRule: CIClassCommentRule.
	validator addRule: CIUncategorizedMethodRule.
	validator addRule: CICodeCriticsRule ".
	^ validator