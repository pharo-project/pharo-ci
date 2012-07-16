"Load Opal Compiler"

Gofer new
	url: 'http://smalltalkhub.com/mc/MarcusDenker/PetitParser/main';
	package: 'PetitParser';
	package: 'PetitTests';
	package: 'PetitSmalltalk';
	load.

Gofer new
	url: 'http://smalltalkhub.com/mc/MarcusDenker/Opal/main';
	package: 'OpalCompiler-Core';
	package: 'OpalCompiler-Tests';
	package: 'OpalDecompiler';
	package: 'OpalCompiler-RegressionTests';
	load.


