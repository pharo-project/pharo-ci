accessing
user
	^ OSPlatform env at: 'PHARO_CI_USER' ifAbsent: nil.