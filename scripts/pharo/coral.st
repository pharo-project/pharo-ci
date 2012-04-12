"Gofer new squeaksource: 'Coral'; package: 'ConfigurationOfCoral'; load."
Gofer new url: 'http://ss3.gemstone.com/ss/coral';
    package: 'ConfigurationOfCoral';
    load.

(Smalltalk at: #ConfigurationOfCoral) perform: #loadDevelopment.
(Smalltalk at: #CoralInstaller) perform: #generateCoralScript.
(Smalltalk at: #CoralInstaller) perform: #generateAllExamples.
" (Smalltalk at: #CoralREADME) perform: #openWorkspaces. "

