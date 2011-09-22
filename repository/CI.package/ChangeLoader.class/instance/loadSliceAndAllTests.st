protocol
loadSliceAndAllTests

	"Load slice and run tests"
	self issue slice
		ifNotNil: [:slice | 
			
			"here I load the code"
			slice load.
		
			"Then I run test"
			self isAllGreen
				ifTrue: [ self issue fixToInclude ]
				ifFalse:[ self issue reviewNeeded:  self buildGreenReport ]]