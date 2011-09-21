testing
isGreen
	"return true if all the tests of the affected package are green"
	^ self runRelatedTests hasPassed