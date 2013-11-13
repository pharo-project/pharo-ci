"Run Pier 2 Tests"
[ HDCoverageReport runPackages: #('OpalCompiler-Tests') ]
	on: Deprecation
	do: [ :err | err resume ]
