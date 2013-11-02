accessing
parentCase
	
	^ parentCase isInteger 
		ifTrue: [ parentCase := self loadParentCase ]
		ifFalse: [ parentCase ]