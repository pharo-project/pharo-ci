accessing
password
	^ OSPlatform env at: 'PHARO_CI_PWD' ifAbsent: nil.