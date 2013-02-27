accessing
slice
	^ slice ifNil: [ slice := self loadSlice ].