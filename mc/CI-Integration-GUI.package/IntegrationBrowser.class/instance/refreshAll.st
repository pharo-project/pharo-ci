actions
refreshAll
	config := nil.
	self manager ensureLoggedIn.
	self refreshIssues.
	commentText text: ''.
	preLoadText text: ''.
	postLoadText text: ''