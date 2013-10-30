testing
testExplicitRemoveFalsePositivesFrom
	| rule errors before after |
	
	rule := CISmallIntRule new.
	
	before := RBNoClassCommentRule new
		result: (RBClassEnvironment classes: { Array });
		yourself.
	
	after := RBNoClassCommentRule new
		result: (RBClassEnvironment classes: { Array. Set });
		yourself.
	
	errors := rule 
		removeFalsePositives: { before }
		from: { after }.
	
	self
		assertCollection: errors first result classes asArray
		equals: { Set }.