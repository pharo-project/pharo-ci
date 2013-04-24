baselines
baseline107: spec
	<version: '1.07-baseline'>

	spec for: #pharo do: [	
		spec blessing: #baseline.
		spec repository: 'http://smalltalkhub.com/mc/Pharo/ci/main'.
	
		self soup: spec;
			commandShell: spec;
			fuelMetalevel: spec;
			zinc: spec.
				
		spec
			package:  'CI-Core';
			package: 'CI-FogBugzAPI' with: [ spec requires: #('CI-Core') ];
			package: 'CI-GoogleIssueTracker' with: [ spec requires: #('CI-Core') ];
			package: 'CI-Integration' with: [ 
				spec requires: #(  'CI-Core' 'CI-FogBugzAPI' 'Soup' 'CommandShell' 'FuelMetalevel' 'Zinc')];
			package: 'CI-Loader' with: [ 
				spec requires: #( 'Soup' 'CI-Core' )].
			
		spec 
			group: 'default' with: #( 'CI-Core' );
			group: 'full' with: #( 'CI-Integration' 'CI-Loader' );
			group: 'soup' with: #( 'Soup' ) "for laziliy loading the Soup packages"]