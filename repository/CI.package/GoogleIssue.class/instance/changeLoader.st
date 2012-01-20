integration
changeLoader
	^ changeLoader ifNil: [ changeLoader := ChangeLoader issue: self ].