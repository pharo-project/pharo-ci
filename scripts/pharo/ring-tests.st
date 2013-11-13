"Run Ring Tests"
[ HDCoverageReport runPackages: #('Ring-Tests') ]
	on: Deprecation
	do: [ :err | err resume ]
