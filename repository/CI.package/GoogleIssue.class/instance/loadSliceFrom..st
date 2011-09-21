loading
loadSliceFrom: gofer
	|match slices|
	
	match := 'SLICE-Issue-', id asString.
	slices := gofer allResolved select: [ :ref| ref name beginsWith: match].
	
	slices ifEmpty: [ ^ nil ].
	
	slices size == 1 ifTrue: [ ^ slices first ].
	
	" get the last version "
	^ (slices sort: [ :a :b | a versionNumber >= b versionNumber ]) first