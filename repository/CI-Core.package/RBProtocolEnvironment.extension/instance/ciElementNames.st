*CI-Core
ciElementNames
	^ self protocols sorted collect: [ :symbol | class asString, ':', symbol ]