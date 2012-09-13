"Explicitely load Metacello since it's currently broken"
[ Gofer it
        url: 'http://seaside.gemstone.com/ss/metacello';
        package: 'ConfigurationOfMetacello';
        load.
       
(Smalltalk at: #ConfigurationOfMetacello) project stableVersion load: 'batch'. 
] on: Error do: [ :f| ].

[(Smalltalk at: #ConfigurationOfMetacello) project stableVersion load: 'batch'. ] on: Error do: [ :f| ].

Gofer new
	url: 'http://smalltalkhub.com/mc/BenjaminVanRyseghem/Nemo/main';
	package: 'ConfigurationOfNemo';
	load.
	
(Smalltalk at: #ConfigurationOfNemo) perform: #loadDefault.


"2.0 load rage"
Compiler recompileAll.
