as yet unclassified
login: aPasswordString
	"request a authentification token from google: see http://code.google.com/p/support/wiki/IssueTrackerAPI"
	
	| result client|
	
	client := ZnClient new 
					url: 'https://www.google.com/accounts/ClientLogin';
					yourself.
	
	client 
		formAt: #accountType put: #GOOGLE;
		formAt: #service put: self service;
		formAt: #source put: 'pharo-googleCI-1.0';
		formAt: #Email put: self user email;
		formAt: #Passwd put: aPasswordString.
	
	self handleLoginResult: client post.