"load handle code. loading works with normal VM"
Gofer new 
	squeaksource: 'Handle';
	package: 'Handles';
	package: 'HandleSupport';
	load.

	
Smalltalk perform: #recreateSpecialObjectsArrayForHandle.
