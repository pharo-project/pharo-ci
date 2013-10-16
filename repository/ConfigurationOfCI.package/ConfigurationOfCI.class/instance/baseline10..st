baselines
baseline10: spec
	<version: '1.0-baseline'>

	spec for: #pharo do: [	
		spec blessing: #baseline.
		spec repository: 'http://smalltalkhub.com/mc/Pharo/ci/main'.
	
		self 
			soup: spec;
			fileSystemLegacy: spec;
			commandShell: spec.
				
		spec
			package:  'CI-Core';
			package: 'CI-Integration' with: [ 
				spec requires: #('Soup' 'CI-Core' 'FileSystem-Legacy' 'CommandShell')];
			package: 'CI-Loader' with: [ 
				spec requires: #('Soup' 'CI-Core')].
			
		spec 
			group: 'default' with: #('CI-Core');
			group: 'full' with: #('CI-Integration' 'CI-Loader');
			group: 'soup' with: #('Soup') "for laziliy loading the Soup packages"]