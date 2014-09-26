accessing
spec 
	<spec: #default>
	
	^ SpecLayout composed 
		newRow: [ :r | 
			r 
				newColumn: #refreshButton;
				newColumn: #configureButton;
				newColumn: #integrateButton ]