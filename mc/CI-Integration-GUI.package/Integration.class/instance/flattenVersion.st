accessing
flattenVersion
	^ self version reject: [ :each | each = $. ] 