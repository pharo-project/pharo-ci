testing
isGreen
	"return true if all the tests of the affected package are green"
	^ (ChangeLoader issue: self) isGreen