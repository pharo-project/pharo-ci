"PetitParser"
Gofer new
	squeaksource: 'rb';
	package: 'AST-Core';
	load.

Gofer new
	url: 'http://smalltalkhub.com/mc/MarcusDenker/PetitParser/main';
	package: 'PetitParser';
	package: 'PetitTests';
	package: 'PetitAnalyzer';
	package: 'PetitBeta';
	package: 'PrettyPetit';
	load.
!
"PetitParser Examples"
Gofer new
    	url: 'http://smalltalkhub.com/mc/MarcusDenker/PetitParser/main';
	package: 'PetitSmalltalk';
	package: 'PetitXml';
	load.
