helper
elementsFromLintRule: lintRule

	| resultClass result |
	resultClass := lintRule resultClass.
	result := lintRule result.
	self flag: 'Couldnt be much uglier...'.
	(resultClass includesBehavior: RBClassEnvironment)
		ifTrue: [ ^ result classNames sorted ].
	(resultClass includesBehavior: RBPackageEnvironment)
		ifTrue: [ ^ result packageNames sorted ].
	(resultClass includesBehavior: RBSelectorEnvironment)
		ifTrue: [ ^ result methodStrings sorted ].
	(resultClass includesBehavior: RBCategoryEnvironment)
		ifTrue: [ ^ (result categories collect: [ :each | each asString ]) sorted].
	(resultClass includesBehavior: RBProtocolEnvironment)
		ifTrue: [ ^ result protocols sorted collect: [ :symbol | result targetClass asString, ':', symbol ] ].
	(resultClass includesBehavior: RBPackageEnvironment)
		ifTrue: [ ^ ((result instanceVariables associations, result classVariables associations) select: #asString) sorted  ].
	^ #()