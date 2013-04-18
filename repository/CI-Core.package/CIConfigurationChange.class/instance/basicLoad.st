protocol
basicLoad
	self configuration load.
	self impactedPackages: self resolveImpactedPackages.