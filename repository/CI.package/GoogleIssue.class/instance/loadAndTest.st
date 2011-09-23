integration
loadAndTest
	"try to load this issue using the ChangeLoader which will update the tracker status accordingly"
	
	|changeLoader|
	
	self ensureFix.
	
	changeLoader := ChangeLoader issue: self.
	^ changeLoader loadAndTest.
	
	
	
	