testing
runTestOnClasses: aCollection
	" I run tests a first time to be able to remove false errors later"
	|suite|
	suite := TestSuite new.
	suite addAll: aCollection.
			
	^ testResult := suite run.