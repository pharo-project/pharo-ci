*CI-Integration
newUpdates
	"Return a list of fully formed URLs of update files we do not yet have up to the upToNumber instance variable if set." 

	"self new newUpdates"

	| existing out list result doc raw char |
	out := OrderedCollection new.
	existing := SystemVersion current updates.
	(result := ZnEasy get: self updateListFileURLString) isSuccess
		ifFalse: [ self error: 'Cannot access update server' ].
	"one file name per line"
	list := self extractVersion: SystemVersion current version from: result contents.
	list reverseDo: [:fileName | | itsNumber |
		itsNumber := fileName initialIntegerOrNil. 
		(existing includes: itsNumber)
			ifFalse: [ (itsNumber isNil or: [itsNumber <= self upToNumber])
							ifTrue: [out addFirst: self updateFolderURL, fileName]]
			ifTrue: [^ out]].
	"("
	(out size > 0) "or: 
			[char := doc reset; skipSeparators; next.
			(char == $*) | (char == $#)])"  ifTrue:
				[^ out "we have our list"].	
	self feedback: 'All code update servers seem to be unavailable'.
	^ out