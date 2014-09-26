private script
buildAuthorScriptWith: aString 
	^ String streamContents: [ :stream |
		stream << 'Author useAuthor: ''TheIntegrator'' during: [ ' << String cr << aString << ' ]' ]