accessing
spec 
	<spec: #default>
	^ SpecLayout composed 
		newColumn: [ :c |
			c 
				newRow: [ :r | r newColumn: #tagLabel width: 100; newColumn: #tagText ] height: 30;
				newRow: [ :r | r newColumn: #configurationLabel width: 100; newColumn: #configurationText ] height: 30;
				newRow: [ :r | 
					r
						newColumn: [ :col |  
							col 
								newRow: #preloadLabel height: 30;
								newRow: #preloadText ]; 
						newColumn: [ :col | 
							col 
								newRow: #postloadLabel height: 30;
								newRow: #postloadText  ] ] ]