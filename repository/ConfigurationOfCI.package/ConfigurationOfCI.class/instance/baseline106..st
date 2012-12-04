baselines
baseline106: spec
	<version: '1.06-baseline'>

	spec for: #pharo do: [	
		spec blessing: #baseline.
		spec repository: 'http://ss3.gemstone.com/ss/ci'.
	
		"Dependencies"
		spec project: 'Soup' with: [
			spec 
				className: 'ConfigurationOfSoup';
				repository: 'http://www.squeaksource.com/Soup'].
			
		spec project: 'OSProcess' with: [
			spec
				className: 'ConfigurationOfOSProcess';
				versionString: #stable;
				repository: 'http://www.smalltalkhub.com/MetacelloRepository' ].
			
		spec package: 'Filesystem-Legacy' with: [
			spec repository: 'http://www.squeaksource.com/mc/dh83/fisleg/main/' ].
				
		spec
			package:  'CI-Core';
			package: 'CI-Integration' with: [ 
				spec requires: #( 'Soup' 'CI-Core' 'Filesystem-Legacy' 'OSProcess' )];
			package: 'CI-Loader' with: [ 
				spec requires: #( 'Soup' 'CI-Core' )].
			
		spec 
			group: 'default' with: #( 'CI-Core' );
			group: 'full' with: #( 'CI-Integration' 'CI-Loader' );
			group: 'soup' with: #( 'Soup' ) "for laziliy loading the Soup packages"]