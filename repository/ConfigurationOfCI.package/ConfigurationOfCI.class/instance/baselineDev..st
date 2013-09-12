baselines
baselineDev: spec
	<version: '999-dev-baseline'>

	spec for: #pharo do: [	
		spec blessing: #baseline.
		spec repository: 'http://smalltalkhub.com/mc/Pharo/ci/main'.
	
		self soup: spec;
			fileSystemLegacy: spec;
			commandShell: spec;
			zinc: spec;
			xmlWriter: spec.
				
		spec
			package: 'CI-Core' with: [ 
				spec requires: #( 'FileSystem-Legacy' 'CommandShell' 'XMLWriter')];
			package: 'CI-FogBugzAPI' with: [ 
				spec requires: #('CI-Core')];
			package: 'CI-GoogleIssueTracker' with: [
				spec requires: #('CI-Core')];
			package: 'CI-Integration' with: [ 
				spec requires: #('CI-Core' 'CI-FogBugzAPI' 'Soup' 'CommandShell')];
			package: 'CI-Loader' with: [ 
				spec requires: #('Soup' 'CI-Core')].
			
		spec 
			group: 'default' with: #('CI-Core' 'CI-Integration' 'CI-Loader');
			group: 'core'    with: #('CI-Core') ]