testing
runAllTests
	"here use self impectedClasses"
	|smallIntRules packageEnvironment|
	smallIntRules := OrderedCollection new.
	self change impactedPackages do: [ :impacted |
		packageEnvironment := RBBrowserEnvironment new
		forPackageNames: (Array with: impacted).
		packageEnvironment label: impacted.
		(HDLintReport runEnvironment: packageEnvironment) rules do: [ :aLintRule | 
			smallIntRules add: aLintRule asString.]].
	^ testResult := smallIntRules.