"Load the Integration manager"
Gofer new
	url: 'http://ss3.gemstone.com/ss/ci';
	package: 'ConfigurationOfCI';
	load.
	
(Smalltalk at: #ConfigurationOfCI) perform: #load.

"save the image first separately to prevent possible OSProcess errors"
Smalltalk snapshot: true andQuit: false.
