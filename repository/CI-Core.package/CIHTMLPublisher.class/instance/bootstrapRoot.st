accessing
bootstrapRoot
	"return the root url for twitter bootstrap"
	^ bootstrapRoot ifNil: [ 'http://files.pharo.org/extra/bootstrap/' ]