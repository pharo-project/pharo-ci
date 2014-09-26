menu
menuCommandOn: aBuilder 
	<worldMenu>
	
	(aBuilder item: #'Integration Browser')
		order: 0;
		icon: Smalltalk ui icons smallAuthoringToolsIcon;
		action: [ self open ]