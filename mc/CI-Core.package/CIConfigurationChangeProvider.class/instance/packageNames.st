private
packageNames
	| names fullName aStream |
	aStream := (ZnClient new get: self url) readStream.
	names := OrderedCollection new.
	[aStream atEnd] whileFalse:
		[[aStream upTo: $<. {$a. $A. nil} includes: aStream next] whileFalse.
		aStream upTo: $".
		aStream atEnd ifFalse: [
			fullName := aStream upTo: $".
			names add: fullName unescapePercents]].
	^ names select: [:each |  '*.mcz' match: each ]