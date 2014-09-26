accessing
spec
	<spec: #default>
	
	^ SpecLayout composed 
		newColumn: [ :c | 
			c 
				newRow: #toolBarPanel height: 35;
				newRow: #issueList;
				newRow: #scriptTabPanel height: 200 ]