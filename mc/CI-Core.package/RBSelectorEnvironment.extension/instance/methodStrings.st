*CI-Core
methodStrings
	| result |
	result := Array streamContents: [ :stream |
		self classSelectors keysAndValuesDo: [ :className :selectors |
			selectors do: [ :selector |
				stream nextPut: (className, '>>', selector printString) ]].
		self metaClassSelectors keysAndValuesDo: [ :className :selectors |
			selectors do: [ :selector |
				stream nextPut: (className, ' class>>', selector printString) ]]].
	^ result sorted