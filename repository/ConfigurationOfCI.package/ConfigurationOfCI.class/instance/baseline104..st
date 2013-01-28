baselines
baseline104: spec
	<version: '1.04-baseline'>

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
				
		spec project: 'ZincHTTPComponents' with: [
			spec
				className: 'ConfigurationOfZincHTTPComponents';
				versionString: #stable;
				repository:  'http://www.squeaksource.com/ZincHTTPComponents'].
				
		spec package: 'Zodiac-Core' with: [
			spec repository: 'http://www.squeaksource.com/Zodiac' ].
			
		spec
			package:  'CI-Core' with: [ 
				spec requires: #( 'ZincHTTPComponents' 'Zodiac-Core' )];
			package: 'CI-Integration' with: [ 
				spec requires: #( 'Soup' 'CI-Core' 'OSProcess')];
			package: 'CI-Loader' with: [ 
				spec requires: #( 'Soup' 'CI-Core' )].
			
		spec 
			group: 'default' with: #( 'CI-Core' );
			group: 'full' with: #( 'CI-Integration' 'CI-Loader' );
			group: 'soup' with: #( 'Soup' ) "for laziliy loading the Soup packages"]