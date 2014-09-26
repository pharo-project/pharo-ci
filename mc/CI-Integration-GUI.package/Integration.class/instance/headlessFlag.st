private
headlessFlag
	Smalltalk os isMacOSX ifTrue: [ ^ '--headless' ]. 
	Smalltalk os isUnix ifTrue: [ ^ '--nodisplay' ].
	
	Error signal: 'Invalid platform. You need to run integration in linux or mac'