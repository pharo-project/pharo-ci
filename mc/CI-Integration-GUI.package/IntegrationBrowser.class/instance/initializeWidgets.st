initialization
initializeWidgets 
	self instantiateModels: #(
		toolBarPanel 		IntegrationBrowserToolBarPanel 
		issueList				TreeModel
		scriptTabPanel		TabManagerModel).
		
	self issueList 
		columns: { 
			TreeColumnModel new 
				headerLabel: 'Number';
				displayBlock: [ :node | node content id ]; 
				initialWidth: 80;
				yourself.
			TreeColumnModel new
				headerLabel: 'Project'; 
				displayBlock: [ :node | node content projectTitle ]; 
				initialWidth: 180;
				yourself.
			TreeColumnModel new 
				headerLabel: 'Pre';
				displayBlock: [ :node | self convertBooleanToString: node content hasPreload ]; 
				initialWidth: 32;
				yourself. 
			TreeColumnModel new 
				headerLabel: 'Pos';
				displayBlock: [ :node | self convertBooleanToString: node content hasPostload ]; 
				initialWidth: 32;
				yourself. 
			TreeColumnModel new 
				headerLabel: 'Cfg';
				displayBlock: [ :node | self convertBooleanToString: node content hasConfiguration ]; 
				initialWidth: 32;
				yourself. 
			TreeColumnModel new 
				headerLabel: 'Title';
				displayBlock: [ :node | node content title ]; 
				initialWidth: 480;
				yourself. 
			TreeColumnModel new 
				headerLabel: 'Status';
				displayBlock: [ :node | node content status ];
				yourself};
		autoMultiSelection: true;
		beCheckList;
		menu: [ :menu | self buildIssueMenuOn: menu ].
				
	self scriptTabPanel 
		addTab: self createPreLoadTab;
		addTab: self createPostLoadTab;
		addTab: self createCommentTab.
		
	self toolBarPanel refreshButton action: [ self refreshAll ]. 
	self toolBarPanel configureButton action: [ self configure ]. 
	self toolBarPanel integrateButton action: [ self integrate ]. 
	
	self focusOrder 
		add: self issueList;
		add: self scriptTabPanel.
		
	self refreshAll