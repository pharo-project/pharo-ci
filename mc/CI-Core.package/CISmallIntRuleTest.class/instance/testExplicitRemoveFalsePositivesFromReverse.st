testing
testExplicitRemoveFalsePositivesFromReverse
	"Basically the same test as testExplicitRemoveFalsePositivesFrom but with switched #before and #after resulting in an empty collection"
	| rule errors before after |
	
	rule := CISmallIntRule new.
	
	before := RBNoClassCommentRule new
		result: (RBClassEnvironment classes: { Array. Set });
		yourself.
	
	after := RBNoClassCommentRule new
		result: (RBClassEnvironment classes: { Array. });
		yourself.
	
	errors := rule 
		removeFalsePositives: { before }
		from: { after }.
	
	self assert: errors isEmpty.