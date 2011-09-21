protocol
loadCSAndAllTests

	| aStringCollection |
	
	aStringCollection := self issue linksForAttachments.
	"here I load the code"
	aStringCollection do: [:aString | FileStream fileIn: aString ] .
	
	"Then I run test"
	^ self isAllGreen