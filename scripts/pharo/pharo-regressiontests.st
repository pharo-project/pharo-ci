"Load Regression Tests"
Gofer new
	squeaksource: 'PharoNonCorePackages';
	package: 'RegressionTests';
	load.
HDTestReport runPackages: #('RegressionTests').
