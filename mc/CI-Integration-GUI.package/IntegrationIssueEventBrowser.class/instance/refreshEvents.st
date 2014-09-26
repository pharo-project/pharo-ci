actions
refreshEvents
	self eventList roots: (self issue events sorted: [ :a :b | b date < a date ])