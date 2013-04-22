adding
addMessage: aMessage forFile: aFileNameString

	messages add:(String streamContents: [ :stream|
		aFileNameString ifNotNil: [ 
			stream << 'SmallIntRules ' << aFileNameString << ':'; lf].
		aMessage do:[ :aMessageText |
			stream tab print: aMessageText; lf.]]).