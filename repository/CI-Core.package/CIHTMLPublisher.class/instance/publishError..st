helper
publishError: anError	
	self 
		publishResultGroupWithTitle: ('Exception: <code>', anError printString, '</code>')
		with: [
			self stream << '<pre id="error-content-'; print: itemId; << '" class="pre-scrollable" >'.
			anError signalerContext ifNotNil: [ :context | 
				context debugStack: 100 on: self stream ].
			self stream << '</pre>'
		]