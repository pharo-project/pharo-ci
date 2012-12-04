setup
googleCodeUser
	googleCodeUser ifNotNil: [ ^ googleCodeUser ].
	googleCodeUser := OSProcess thisOSProcess environment at: 'PHARO_CI_USER ' ifAbsent: nil.
	^ googleCodeUser