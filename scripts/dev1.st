"Dev image"
Gofer new
	squeaksource: 'MetacelloRepository';
	package: 'ConfigurationOfPharo';
	load.

((Smalltalk at: #ConfigurationOfPharo) project version: '1.1') perform: #silently: with: true; perform: #load.
