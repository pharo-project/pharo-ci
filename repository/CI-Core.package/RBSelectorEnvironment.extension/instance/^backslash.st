*CI-Core
\ other
	| instance |
	(other isKindOf: self species)
		ifFalse: [ ^ super \ other ].
	instance := self class new.
	instance 
		classSelectors: (self subtractSelectorDictionary: other classSelectors from: classSelectors)
		metaClassSelectors: (self subtractSelectorDictionary: other metaClassSelectors from: metaClassSelectors);
		searchStrings: self searchStrings \ other searchStrings.
	^ instance