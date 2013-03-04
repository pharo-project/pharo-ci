migrating
migrateFrom: start to: stop
	| errors |
	
	errors := OrderedCollection new.

	'Migrating issues'
	displayProgressFrom: start to: stop
	during: [:bar |
		start to: stop do: [:idx || issue |
			bar value: idx.
			[ 
				issue := self googleTracker issue: idx.
				bar title: 'Migrating ', issue id asString, ': ', issue title.
				issue hasBeenAlreadyMigrated
					ifFalse: [ 
						[ issue migrateToFogBugzWith: self fogBugzTracker ]
						on: Error 
						do: [ errors add: issue ]]]
				on: SubscriptOutOfBounds 
				do: []]].
	
	errors isEmpty
		ifFalse: [ self halt ].
	^ errors