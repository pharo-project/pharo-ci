initialization
initializeWidgets 

	self instantiateModels: #(
		title 			TextInputFieldModel
		description 	TextModel 
		type 			DropListModel ).
					
	title 
		ghostText: 'Title';
		autoAccept: true;
		entryCompletion: nil.
		
	type items: self createTypes.
	
	description 
		text: 'ENTER DESCRIPTION HERE';
		readSelectionBlock: [ (0 to: 22) ];
		acceptBlock: [ description readSelectionBlock: [ (1 to: 0) ]]