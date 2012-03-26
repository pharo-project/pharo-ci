versions
version107: spec
	<version: '1.07' imports: #('1.02-baseline' )>

	spec for: #'common' do: [
		spec 
			blessing: #'development';
			description: '1.07: Almost done';
			author: 'BenjaminVanRyseghem et CamilloBruni';
			timestamp: '3 October 2011 5:10:55 pm'. 
			
		spec
			preLoadDoIt: #preload107 ].

	spec for: #'pharo' do: [
		spec 
			package: 'CI' with: 'CI-BenjaminVanRyseghem.87';
			package: 'Soup-Core' with: 'Soup-Core-CamilloBruni.14';
			package: 'Soup-XPath' with: 'Soup-XPath-CamilloBruni.3'].