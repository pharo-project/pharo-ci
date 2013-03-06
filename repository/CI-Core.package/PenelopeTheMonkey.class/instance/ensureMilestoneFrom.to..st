migrating
ensureMilestoneFrom: start to: stop
	| errors |
	
	errors := OrderedCollection new.

	'Ensuring Milestones'
	displayProgressFrom: start to: stop
	during: [:bar |
		start to: stop do: [:idx || issue |
			bar value: idx.
			[ 
				issue := self googleTracker issue: idx.
				bar title: 'Ensuring Milestone for ', issue id asString, ': ', issue title.
				issue hasBeenAlreadyMigrated
					ifTrue: [ 
						[ issue ensureMilestoneFor: self fogBugzTracker ]
						on: Error 
						do: [ errors add: issue ]]]
				on: SubscriptOutOfBounds 
				do: []]].
	
	errors isEmpty
		ifFalse: [ self halt ].
	^ errors