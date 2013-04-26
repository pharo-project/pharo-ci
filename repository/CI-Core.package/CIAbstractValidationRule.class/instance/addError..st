adding
addError: anError
	|index| 
	
	self flag: 'ugly'.
	anError isString 
		ifTrue: [ ^ errors add: anError ].
		
	index := 1.
	errors add:(String streamContents: [ :stream|
		stream tab print: anError; lf.
		(anError signalerContext contextStack first: 10) do: [ :context|
			stream << (index asString padded: #left to: 2 with: $ ); << ':'; tab.
			"indent the error string"
			stream << (context asString copyReplaceAll: String cr with: String lf, String tab); lf.
			index := index + 1].
		stream tab << '...'])