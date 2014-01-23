*CI-Core
methodStrings
	"We want to have the Class>>#selector strings for all methods in this environment.
	#methods only returns the methods that actually exists in the image, which is not useful for the CI service when used with SelectorEnvironments."
	^ (self methods sorted: CompiledMethod sortBlock) collect: #asString