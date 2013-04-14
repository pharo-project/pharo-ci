accessing
slice
	^ slice ifNil: [ self loadSlice ]