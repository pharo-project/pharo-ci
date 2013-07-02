private
listConfigurations
	| finalList |
	finalList := OrderedCollection new.
	self packageNames do:[:each | 
		finalList addIfNotPresent: (((each subStrings: '-') at:1) ).
	].
	^ finalList.