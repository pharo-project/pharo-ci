result handling forked image
publishResult: aBlock
	| oldGlobals newGlobals globals result |
	
	oldGlobals := Smalltalk globals asSet.
	result := aBlock value.
	"For stability reason avoid rehashing before filtering the globals as there
	might be objects without proper hashes in there, strange case, but it has happened "
	newGlobals := Set new.
	Smalltalk globals valuesDo: [ :global | 
		global isBehavior
			ifTrue: [ newGlobals add: global ]].
		
	globals := newGlobals \ oldGlobals.
	
	self inform: 'B: Publishing result: ', result asString.
	self serializeGlobals: globals result: result