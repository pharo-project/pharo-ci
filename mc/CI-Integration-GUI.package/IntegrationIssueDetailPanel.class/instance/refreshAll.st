private
refreshAll
	self tagText text: (self issue tagsString ifEmpty: [ '' ]).
	self configurationText text: self issue fullConfiguration.
	self preloadText text: self issue preload.
	self postloadText text: self issue postload