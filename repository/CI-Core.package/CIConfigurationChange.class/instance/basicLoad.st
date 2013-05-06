protocol
basicLoad
	self configurationPoint  load. "load should be replace by project version: self version."
	self impactedPackages: self resolveImpactedPackages.