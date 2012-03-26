versions
version102: spec
	<version: '1.02' imports: #('1.02-baseline' )>

	spec for: #'common' do: [
		spec 
			blessing: #'development';
			description: '1.02: Ready to be Used based on Soup';
			author: 'BenjaminVanRyseghem et CamilloBruni';
			timestamp: '2011-09-21 16:28:04'. 
			
		spec
			preLoadDoIt: #preload102 ].

	spec for: #'pharo' do: [
		spec 
			package: 'CI' with: 'CI-CamilloBruni.25';
			package: 'Soup-Core' with: 'Soup-Core-CamilloBruni.13'].