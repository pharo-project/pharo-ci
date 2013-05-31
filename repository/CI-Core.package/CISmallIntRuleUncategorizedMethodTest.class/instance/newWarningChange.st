accessing
newWarningChange
	^ CITestChange loadBlock: [ 
		(Object subclass: #CITestClass	
			instanceVariableNames: ''
			classVariableNames: ''
			poolDictionaries: ''
			category: 'CI-Test') asLocalObject.
		 (Smalltalk at:#CITestClass) compile: 'testingUngategorized
^ self']
	
	