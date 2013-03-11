migrating
migrateIssues: aCollection
	| size errors |
	
	size := aCollection size.
	errors := OrderedCollection new.

	'Migrating issues'
	displayProgressFrom: 0 
	to: size
	during: [:bar |
		aCollection doWithIndex: [:idx :barIdx || issue |
			bar value: barIdx.
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