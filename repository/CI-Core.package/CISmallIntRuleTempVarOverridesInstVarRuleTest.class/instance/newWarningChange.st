accessing
newWarningChange
	^ CITestChange loadBlock: [ 
		(Object subclass: #CITestClassForNoCommentRule
			instanceVariableNames: 'var'
			classVariableNames: ''
			poolDictionaries: ''
			category: 'CI-Test').
		 (Smalltalk at:#CITestClass) compile: 'tempVarOverride
		| var |
^ var '  ]
	
	