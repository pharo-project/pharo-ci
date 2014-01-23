tests
testContents
	| file |

	file := self defaultExport.
	
	self 
		assert: file readStream contents asString 
		equals: self defaultContent.