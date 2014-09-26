initialization
createPostLoadTab
	^ self newTab 
		label: 'Postload';
		closeable: false;
		model: (postLoadText := self newText);
		yourself