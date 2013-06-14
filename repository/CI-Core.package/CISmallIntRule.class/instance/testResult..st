tests
testResult: aSmallIntResult

	aSmallIntResult do: [ :each |
		each classes do: [ :class |
			self addWarning: each label asString, ' ', class asString ]].