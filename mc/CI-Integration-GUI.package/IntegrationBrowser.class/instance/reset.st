actions
reset
	self manager tracker logOff.
	self refreshAll.
	self config isEmpty
		ifTrue: [ self configure ] 