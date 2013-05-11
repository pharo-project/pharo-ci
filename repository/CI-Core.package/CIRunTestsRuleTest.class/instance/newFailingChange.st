accessing
newFailingChange
	^ [ | class |
		class := self createNewTestClass.
		class compile: 'testFail
			self fail'.
		class compile: 'testError
			Error signal: #anErrorDescription asWideString ' ] asCIChange