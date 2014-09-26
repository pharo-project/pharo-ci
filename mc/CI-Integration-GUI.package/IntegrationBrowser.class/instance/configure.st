actions
configure
	| panel |
	
	panel := IntegrationConfigurePanel new
		config: self config;
		yourself.
		
	panel openDialogWithSpec 
		okAction: [ self config: panel newConfig ];
		centered;
		modalRelativeTo: World