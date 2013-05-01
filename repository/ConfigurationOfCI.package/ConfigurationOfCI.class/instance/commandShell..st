external projects
commandShell: spec
	spec project: 'CommandShell' with: [
		spec
			requires: #( 'FileSystem-Legacy' );
			className: 'ConfigurationOfCommandShell';
			version: #stable;
			repository: 'http://www.squeaksource.com/MetacelloRepository' ].