accessing
newFailingChange
	^ [ | class |
		class := self createNewTestClass.
		self inform: 'Created new Class ', class name.
		class compile: 'testFail
			self inform: #runningtest
			self fail'.
		class compile: 'testError
			Error signal: #anErrorDescription asWideString '.
		class compile: 'testError2
			self assert: false description: (Character value: 1000) asWideString ' ] asCIChange