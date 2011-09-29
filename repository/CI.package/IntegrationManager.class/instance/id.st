private
id
	"version number of this integration"
	
	^ (SmalltalkImage current lastUpdateString squeezeOutNumber) + 1