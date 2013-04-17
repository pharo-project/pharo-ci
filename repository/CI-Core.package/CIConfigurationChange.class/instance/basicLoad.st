protocol
basicLoad
	self configuration loadDefault.
	self impactedPackages: self resolveImpactedPackages.