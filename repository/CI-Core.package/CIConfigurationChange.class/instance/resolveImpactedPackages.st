accessing
resolveImpactedPackages
	| aSet |
	aSet := OrderedCollection new.
	RPackage organizer packageNames do: [ :packageName|
		((self name,'-.*') asRegex matches: packageName)
			ifTrue: [ aSet add: packageName ]].
	^ aSet
	