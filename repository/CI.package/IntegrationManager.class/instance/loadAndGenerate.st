entry point
loadAndGenerate
	"My main purpose is to generate a script which made a the fresh image loading the sources"
	"I load the sources and push all the packages on the disk"
	"Download sources from the internet in parallele"
	self loadSources.

	"Generate a script for the loading the source in the fresh image"
	self generateScriptForSources.
	"Here I assume tests will be run in the other image"