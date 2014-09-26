private
collectIssuesAsString: aBlock with: originalString
	| pickedIssues |
	pickedIssues := (self issues collect: aBlock) reject: #isEmptyOrNil.
	^ pickedIssues 
		inject: (originalString ifNil: [ '' ]) trimBoth
		into: [ :all :each | 
			all, 
			((all isEmpty or: [ all last = $. ]) 
				ifTrue: [ '' ] 
				ifFalse: [ '.' ]),
			String cr, 
			each]