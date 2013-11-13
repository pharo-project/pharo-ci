"Run FS Tests"
[ HDCoverageReport runPackages: #('FS-Tests-Core' 'FS-Tests-AnsiStreams' 'FS-Tests-Disk' 'FS-Tests-Memory')] 	on: Deprecation
	do: [ :err | err resume ]
