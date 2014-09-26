accessing
spec 
	<spec: #default>
	^ SpecLayout composed 
		newColumn: [ :c | 
			c 
				newRow: #eventPanel;
				newRow: #detailPanel height: 250 ]
			