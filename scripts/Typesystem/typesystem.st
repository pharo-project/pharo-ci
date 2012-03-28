"Load The TypeSystem ..."
"see  http://pleiad.dcc.uchile.cl/private/gradual-types/installation"


"Installing NCAPI"
Gofer new
	squeaksource: 'OpalFrontend';
	package: 'Compiler-Frontend';
	load.
Gofer new
	squeaksource: 'OpalFrontend';
	package: 'Compiler-Requests';
	load.
Gofer new	
	squeaksource: 'OpalFrontend';
	package: 'Compiler-Debugger';
	load.
Gofer new	
	squeaksource: 'OpalFrontend';
	package: 'Compiler-Shout';
	load.
Gofer new
	squeaksource: 'OpalFrontend';
	package: 'AncientCompiler-Frontend';
	load.
Gofer new	
	squeaksource: 'OpalFrontend';
	package: 'AncientCompiler-Debugger';
	load.
Gofer new
	squeaksource: 'OpalFrontend';
	package: 'AncientCompiler-Shout';
	load.
Gofer new
	squeaksource: 'OpalFrontend';
	package: 'OpalCompiler-Fixes';
	load.
Gofer new	
	squeaksource: 'OpalFrontend';
	package: 'OpalCompiler-Frontend';
	load.
Gofer new	
	squeaksource: 'OpalFrontend';
	package: 'OpalCompiler-Debugger';
	load.
Gofer new
	squeaksource: 'OpalFrontend';
	package: 'OpalCompiler-Shout';
	load.
Gofer new
	squeaksource: 'OpalFrontend';
	package: 'Compiler-Extensions';
	load.

Gofer new
	squeaksource: 'GradualTypeSystem';
	package: 'TypeSystem-Bootstrap';
	load.

(FileStream oldFileNamed: '../scripts/Typesystem/loadfiles.st') fileIn.
TypeConfiguration uniqueInstance bootstrap: false.
(FileStream oldFileNamed: '../scripts/Typesystem/loadfiles.st') fileIn.
(FileStream oldFileNamed: '../scripts/Typesystem/loadfiles.st') fileIn.
