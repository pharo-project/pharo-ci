accessing
ruleClass
	^ RBCompositeLintRule rules: { RBUnclassifiedMethodsRule new. RBNoClassCommentRule new }. 