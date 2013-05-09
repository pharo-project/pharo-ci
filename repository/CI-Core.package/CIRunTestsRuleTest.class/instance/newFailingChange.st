accessing
newFailingChange
	^ [ | class |
		class := self createNewTestClass.
		class compile: 'testFail
			self fail' ] asCIChange