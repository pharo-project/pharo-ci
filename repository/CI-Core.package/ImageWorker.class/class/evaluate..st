image-evaluation
evaluate: aBlock
	self do: [ :worker | ^ worker evaluate: aBlock ].