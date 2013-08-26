accessing
newWarningChange
	
	^ [ | class |
		class := self createNewTestClass.
		class compile: 'testSkip
			self skip: #skipping' ] asCIChange