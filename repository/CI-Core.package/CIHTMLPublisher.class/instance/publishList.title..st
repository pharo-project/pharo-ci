helper
publishList: list title: aString 
	
	self stream 
		nextPutAll: '<h2>'; nextPutAll: aString; nextPutAll: '</h2><ul>'; lf.
	list do: [ :each |
		self stream
			nextPutAll: '<li>';
			nextPutAll: each asString;
			nextPutAll: '</li>'; lf ].
	self stream 
		nextPutAll: '</ul>'.
	