adding
addError: anError
	| index |
	
	self flag: 'ugly'.
	"(anError isKindOf: Exception)
		ifFalse: [ ^ self validationResult addError: anError asString ].
	"
	self flag: 'even uglier'.
	index := 1.
	self validationResult addError: (String streamContents: [ :stream | 
		stream tab print: anError; lf.
		(anError signalerContext contextStack first: 10) do: [ :context | 
			stream << (index asString padded: #left to: 2 with: $ ); << ':'; tab.	
			"indent the error string"
			stream << (context asString copyReplaceAll: String cr with: String lf , String tab); lf.
			index := index + 1 ].
		stream tab << '...' ])