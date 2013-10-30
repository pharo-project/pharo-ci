testing
testExplicitRemoveFalsePositivesFromReverse
	"Basically the same test as testExplicitRemoveFalsePositivesFrom but with switched #before and #after "
	| rule errors before after |
	
	rule := CISmallIntRule new.
	
	before := RBNoClassCommentRule new
		result: (RBClassEnvironment classes: { Array. Set});
		yourself.
	
	after := RBNoClassCommentRule new
		result: (RBClassEnvironment classes: { Array. });
		yourself.
	
	errors := rule 
		removeFalsePositives: { before }
		from: { after }.
	
	self assert: errors first result classes isEmpty.