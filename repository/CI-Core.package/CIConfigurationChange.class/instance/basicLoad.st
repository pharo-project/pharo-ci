protocol
basicLoad
	self configuration "load should be replace by" project version: self version.
	self impactedPackages: self resolveImpactedPackages.