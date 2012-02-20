"install pinoccio ============================================================"
Gofer new url: 'http://ss3.gemstone.com/ss/p';
    package: 'ConfigurationOfPinocchio';
    load.

(Smalltalk at: #ConfigurationOfPinocchio) perform: #loadDevelopment.


"install o-completion ========================================================"
Gofer new
    squeaksource: 'MetacelloRepository';
    package: 'ConfigurationOfOCompletion';
    load.

(Smalltalk at: #ConfigurationOfOCompletion) loadStable.


"create a workspace with the default export =================================="
"TODO"


