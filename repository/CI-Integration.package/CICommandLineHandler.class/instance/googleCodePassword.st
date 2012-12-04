setup
googleCodePassword
	googleCodePassword ifNotNil: [ ^ googleCodePassword ].
	googleCodePassword := OSProcess thisOSProcess environment at: 'PHARO_CI_PWD ' ifAbsent: nil.
	^ googleCodePassword