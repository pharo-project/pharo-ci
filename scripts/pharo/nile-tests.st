"Run Nile Tests"
[ HDCoverageReport runPackages: #('Nile-Tests' 'Nile-Clients' 'Nile-RBScanner')]
	on: Deprecation
	do: [ :err | err resume ]
