entry point
loadAndGenerate
	"I load the sources and push all the packages on the disk"
	| loaders |
	
	"Download sources from the internet in parallele"
	self loadSources.

	"Install sequenticially sources from issues"
	self preLoadScript fileIn.
	loaders := self installSources.
	self postLoadScript fileIn.
	"Here I assume tests will be run in the other image"
	
	"Apply changes"
	scriptLoader doneApplyingChangesSilently.