private
refreshProjects
	| newProjects |

	[ newProjects := self getAllProjects ] on: Error do: [ :ex | ^ self ].
	projects := newProjects