"Run Sista Tests"
[ HDCoverageReport runPackages: #('SistaTests')]
	on: Deprecation
	do: [ :err | err resume ]
