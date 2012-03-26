*CI
compileNewUpdateMethodSilently
	"Use me to create a new update method with the next update number"
	"self new compileNewUpdateMethod"
	

	self class compile: 
		(self newGenerateNewUpdateMethodSilently)
		classified: 'pharo - updates'