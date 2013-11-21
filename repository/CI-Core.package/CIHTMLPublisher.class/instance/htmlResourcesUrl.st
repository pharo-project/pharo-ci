accessing
htmlResourcesUrl
	"return the root url for twitter bootstrap"
	^ htmlResourcesUrl ifNil: [ 'http://files.pharo.org/extra/bootstrap/' ]