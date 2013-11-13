"Run Ring Tests"
[ HDCoverageReport runPackages: #('FullTextSearch') ]
	on: Deprecation
	do: [ :err | err resume ]
