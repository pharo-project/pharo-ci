accessing
spec 
	<spec: #default>
	
	^ SpecLayout composed 
		newColumn: [ :c |
			c 
				newRow: #headerLabel height: 35;
				newRow: #eventList;
				newRow: #commentText ]