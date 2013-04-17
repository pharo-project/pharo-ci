protocol
basicLoad
	VTermOutputDriver stderr green: self name, ' is loading'; lf .
	self configuration loadDefault
	self resolveImpactedPackages.