accessing
newSuccessfulChange
	
	^ [ | class |
		class := self createNewTestClass.
		class compile: 'testSuccess
			self assert: true' ] asCIChange