initialization
createPreLoadTab
	^ self newTab 
		label: 'Preload';
		closeable: false;
		model: (preLoadText := self newText);		
		yourself