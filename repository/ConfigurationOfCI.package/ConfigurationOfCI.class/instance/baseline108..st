as yet unclassified
baseline108: spec
	<version: '1.08-baseline'>
	spec for: #pharo do: [	
		spec blessing: #baseline.
		spec repository: 'http://smalltalkhub.com/mc/Pharo/ci/main'.
	
		self soup: spec;
			fileSystemLegacy: spec;
			commandShell: spec;
			fuelMetalevel: spec;
			zinc: spec.
				
		spec
			package: 'CI-Core' with: [ spec requires: #('FuelMetalevel'  'FileSystem-Legacy' 'CommandShell') ];
			package: 'CI-FogBugzAPI';
			package: 'CI-GoogleIssueTracker';
			package: 'CI-Integration' with: [  spec requires: #(  'CI-Core' 'CI-FogBugzAPI' 'Soup' 'CommandShell' 'Zinc')];
			package: 'CI-Loader' with: [ spec requires: #( 'Soup' 'CI-Core' )].
			
		].