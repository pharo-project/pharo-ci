protocol
basicLoad

	"should look if empty string works"
	(self group isNil )
		ifTrue: [ self configurationPoint  load ]
		ifFalse: [ self configurationPoint load: self group] .
	self impactedPackages: self resolveImpactedPackages.