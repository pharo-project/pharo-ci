initialize
initialize
	
	errors := Set new.
	extraTests := {}.
	loadStopwatch := Stopwatch new.
	testStopwatch := Stopwatch new.
	self retrieveTestClasses