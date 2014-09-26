accessing
spec
	<spec: #default>
	
	^ SpecLayout composed 
		newColumn: [ :c |
			c 
				newRow: #messageLabel height: 35;
				newRow: #logText ]