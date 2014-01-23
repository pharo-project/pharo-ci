*CI-Core
subtractSelectorDictionary: remove from: source
	| result |
	result := source copy.
	remove keysAndValuesDo: [ :key :removeSelectors |
		result 
			at: key
			ifPresent: [ :selectors | | cleanSelectors |
				cleanSelectors := selectors \ removeSelectors.
				cleanSelectors isEmpty
					ifFalse: [ result at: key put: cleanSelectors ]
					ifTrue: [ result removeKey: key ]]].
	^ result