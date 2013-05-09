protocol
validate
	
	^ self newImageDo: [ 
		self validateChangeBlock: [ self change load ]]