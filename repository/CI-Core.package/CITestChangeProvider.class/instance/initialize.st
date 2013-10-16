initialization
initialize
	super initialize.
	self changeBlock: [ :id | 
		CITestChange new
			id: id;
			yourself  ]