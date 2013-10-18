helper
publishError: anError	
	self 
		publishResultGroupWithTitle: anError printString 
		with: [
			self stream << '<pre id="error-content-'; print: itemId; << '" class="pre-scrollable" >'.
			anError signalerContext debugStack: 100 on: self stream.
			self stream << '</pre>'
		]