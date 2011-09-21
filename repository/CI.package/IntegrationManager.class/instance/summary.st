private
summary

	| issues |
	issues := integrated asArray sort: [ :a :b| a id >= b id ].
	
	^ String streamContents: [ :s|
		s << self id asString; cr.
		self id asString size timesRepeat: [ s << '-' ].
		(s cr cr) << 'The following changes have been integrated:'; cr; cr.
		issues 
			do: [:issue| 
				s << 'Issue ' << (issue id asString padded: #left to: 5 with: $ ) 
				  << ':   ' << issue title; cr.
			   s << '               http://code.google.com/p/pharo/issues/detail?id=' << issue id ]
			separatedBy: [ s cr; cr ]]