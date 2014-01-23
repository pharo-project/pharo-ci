baselines
baselineDev: spec
	<version: '999-dev-baseline'>

	spec for: #pharo do: [	
		spec blessing: #baseline.
		spec repository: 'http://smalltalkhub.com/mc/Pharo/ci/main'.
	
		self soup: spec;
			xmlWriter: spec;
			imageWorker: spec;
			commandShell: spec.
				
		spec
			package: 'CI-Core' with: [ 
				spec requires: #( 'CommandShell' 'XMLWriter' 'ImageWorker')];
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