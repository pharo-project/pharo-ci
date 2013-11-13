"Load Nile"
Gofer new
       squeaksource: 'MetacelloRepository'; 
       package: 'ConfigurationOfNile';
       load.

((Smalltalk at: #ConfigurationOfNile) project version: '1.2') load: #(Core Tests)
