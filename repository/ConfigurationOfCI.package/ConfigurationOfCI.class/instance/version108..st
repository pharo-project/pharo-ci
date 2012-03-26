versions
version108: spec
	<version: '1.08' imports: #('1.02-baseline' )>

	spec for: #'common' do: [
		spec 
			blessing: #'development';
			description: '1.08: Updated Zinc References';
			author: 'BenjaminVanRyseghem et CamilloBruni';
			timestamp: '2011-11-21T13:18:39.776+01:00'. 
			
		spec
			preLoadDoIt: #preload107 ].

	spec for: #'pharo' do: [
		spec 
			package: 'CI' with: 'CI-CamilloBruni.88';
			package: 'Soup-Core' with: 'Soup-Core-CamilloBruni.14';
			package: 'Soup-XPath' with: 'Soup-XPath-CamilloBruni.3'].