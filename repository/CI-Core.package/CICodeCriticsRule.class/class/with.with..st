instance creation
with: aLintRule with: anotherLintRule
	^ self new
		addLinRule: aLintRule;
		addLinRule: anotherLintRule;
		yourself