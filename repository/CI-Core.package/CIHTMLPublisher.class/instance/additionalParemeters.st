accessing
additionalParemeters
	"Store additional parameters in the given dictionary, the key should be a simple string whereas the value can contain html markup for links for instance.
	The key/value pairs are going to be displayed in the parameter section of the report."
	^ additionalParemeters ifNil: [ additionalParemeters := Dictionary new ]