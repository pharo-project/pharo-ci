accessing
newWarningChange
	^ CITestChange loadBlock: [ 
		Object subclass: #CITestClass	
			instanceVariableNames: ''
			classVariableNames: ''
			poolDictionaries: ''
			category: 'CI-Test'.
		 (Smalltalk at:#CITestClass) compile: 'testingUngategorized
^ self']
	
	