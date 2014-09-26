scripts
wrap: stream withPreloadAndPostload: aBlock		
	self preload ifNotEmpty: [ 
		stream << self preload.
		stream ensureEndsWith: $..
		stream << String cr ].
	aBlock cull: stream.
	self postload ifNotEmpty: [  
		stream << self postload.
		stream ensureEndsWith: $. ]