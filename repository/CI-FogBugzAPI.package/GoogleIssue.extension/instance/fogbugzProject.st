*CI-FogBugzAPI
fogbugzProject
	| target |
	
	target := self labels detect: [:e | e beginsWith: 'Target' ] ifNone: [ ^ '_Inbox' ].
	^ target copyFrom: 7 to: target size.