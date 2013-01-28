baselines
baseline106: spec
	<version: '1.06-baseline'>

	spec for: #pharo do: [	
		spec blessing: #baseline.
		spec repository: 'http://smalltalkhub.com/mc/Pharo/ci/main'.
	
		"Dependencies"
		spec project: 'Soup' with: [
			spec 
				className: 'ConfigurationOfSoup';
				repository: 'http://www.squeaksource.com/Soup'].
			
		spec project: 'OSProcess' with: [
			spec
				className: 'ConfigurationOfOSProcess';
				versionString: #stable;
				repository: 'http://www.squeaksource.com/MetacelloRepository' ].
			
		spec package: 'FileSystem-Legacy' with: [
			spec repository: 'http://www.smalltalkhub.com/mc/dh83/fisleg/main/' ].
				
		spec
			package:  'CI-Core';
			package: 'CI-Integration' with: [ 
				spec requires: #( 'Soup' 'CI-Core' 'FileSystem-Legacy' 'OSProcess' )];
			package: 'CI-Loader' with: [ 
				spec requires: #( 'Soup' 'CI-Core' )].
			
		spec 
			group: 'default' with: #( 'CI-Core' );
			group: 'full' with: #( 'CI-Integration' 'CI-Loader' );
			group: 'soup' with: #( 'Soup' ) "for laziliy loading the Soup packages"]