accessing package changes
modifiedPackages
	| packages |
	
	packages := Set new.
	self modifiedClasses do: [ :clazz |
		packages add: clazz package ].
	^ packages