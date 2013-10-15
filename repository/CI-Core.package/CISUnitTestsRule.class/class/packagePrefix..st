instance creation
packagePrefix: aString
	^ self selectTestCaseBlock: [ :case |
		case package name beginsWith: aString ]