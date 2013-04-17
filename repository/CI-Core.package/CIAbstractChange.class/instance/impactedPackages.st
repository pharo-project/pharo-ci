accessing
impactedPackages
	^ impactedPackages ifNil: [ ^ self resolveImpactedPackages ]