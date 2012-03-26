versions
version104: spec
	<version: '1.04' imports: #('1.02-baseline' )>

	spec for: #'common' do: [
		spec 
			blessing: #'development';
			description: '1.04: Cleanup and finally real Support for loading Slices';
			author: 'BenjaminVanRyseghem et CamilloBruni';
			timestamp: '23 September 2011 3:41:21 pm'. 
			
		spec
			preLoadDoIt: #preload102 ].

	spec for: #'pharo' do: [
		spec 
			package: 'CI' with: 'CI-CamilloBruni.40';
			package: 'Soup-Core' with: 'Soup-Core-CamilloBruni.14';
			package: 'Soup-XPath' with: 'Soup-XPath-CamilloBruni.3'].