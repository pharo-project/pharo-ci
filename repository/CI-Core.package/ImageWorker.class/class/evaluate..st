image-evaluation
evaluate: aBlock
	| worker result |
	worker := self new.
	[ result := worker evaluate: aBlock ]
		ensure: [ worker close ].
	^ result