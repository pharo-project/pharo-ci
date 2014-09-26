initialization
initializeWidgets 
	self instantiateModels: #(
		headerLabel		LabelModel
		eventList 		TreeModel
		commentText		TextModel).
				
	self headerLabel label: 'Events'.
	self eventList 
		columns: { 
			TreeColumnModel new 
				headerLabel: 'Date';
				displayBlock: [ :node | self convertDateToString: node content date ]; 
				initialWidth: 160;
				yourself.
			TreeColumnModel new 
				headerLabel: 'Author';
				displayBlock: [ :node | node content username ]; 
				initialWidth: 280;
				yourself.
			TreeColumnModel new 
				headerLabel: 'Description';
				displayBlock: [ :node | node content description ];
				yourself};
		whenHighlightedItemChanged: [ :node | 
			node ifNotNil: [ 
				self commentText text: node content comment ] ].	
	
	self commentText enabled: false.
				
	self focusOrder 
		add: self eventList;
		add: self commentText.
