accessing
newFailingChange
	^ [ | class |
		class := self createNewTestClass.
		class compile: 'testFail
			self fail'.
		class compile: 'testError
			Error signal: #anErrorDescription asWideString '.
		class compile: 'testError2
			self assert: false description: (Character value: 1000) asWideString ' ] asCIChange