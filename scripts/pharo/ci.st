"Explicitely load Metacello since it's currently broken"
 Gofer it
        url: 'http://seaside.gemstone.com/ss/metacello';
        package: 'ConfigurationOfMetacello';
        load.
       
(Smalltalk at: #ConfigurationOfMetacello) project stableVersion load: 'batch'. 

Gofer new
	url: 'http://ss3.gemstone.com/ss/ci';
	package: 'ConfigurationOfCI';
	load.
	
(Smalltalk at: #ConfigurationOfCI) perform: #loadFull.
