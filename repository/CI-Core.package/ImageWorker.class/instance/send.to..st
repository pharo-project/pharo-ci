image-evaluation
send: aSelector to: aClassName
	
	^ ((self remote at:aClassName) perform: aSelector  ) asLocalObject 