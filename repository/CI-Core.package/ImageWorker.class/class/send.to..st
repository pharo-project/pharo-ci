image-evaluation
send: aSelector to: aClassName

	^ self do: [ :worker | ^ (worker send: aSelector to: aClassName) ].