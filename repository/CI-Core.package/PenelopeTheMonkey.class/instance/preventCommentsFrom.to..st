migrating
preventCommentsFrom: start to: stop
	| errors |
	
	errors := OrderedCollection new.

	'Migrating issues'
	displayProgressFrom: start to: stop
	during: [:bar |
		start to: stop do: [:idx || issue |
			bar value: idx.
			[ 
				issue := self googleTracker issue: idx.
				bar title: 'Closing ', issue id asString, ': ', issue title.
				issue hasBeenAlreadyClosed
					ifFalse: [ 
						[ issue preventComment ]
						on: Error 
						do: [:ex | errors add: (ex->issue) ]]]
				on: SubscriptOutOfBounds 
				do: []]].
	
	errors isEmpty
		ifFalse: [ self halt ].
		
	^ errors