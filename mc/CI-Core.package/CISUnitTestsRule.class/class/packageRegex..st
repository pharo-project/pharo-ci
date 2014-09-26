instance creation
packageRegex: aRegex
	^ self selectTestCaseBlock: [ :case | case package name matchesRegexIgnoringCase: aRegex ]