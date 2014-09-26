initialization
createCommentTab
	^ self newTab 
		label: 'Comment';
		closeable: false;
		model: (commentText := self newText);
		yourself