versions
version100: spec
	<version: '1.00' imports: #('1.00-baseline' )>

	spec for: #'common' do: [
		spec 
			blessing: #'development';
			description: '1.0: First Configuration (STILL UNDER DEV)';
			author: 'BenjaminVanRyseghem';
			timestamp: '20 September 2011 2:24:40 pm'.
			
		spec
			preLoadDoIt: #'preload100' ].

	spec for: #'pharo' do: [
		spec 
			package: 'CI' with: 'CI-CamilloBruni.16'].