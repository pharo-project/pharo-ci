versions
version101: spec
	<version: '1.01' imports: #('1.00-baseline' )>

	spec for: #'common' do: [
		spec 
			blessing: #'development';
			description: '1.01: Ready to be Used';
			author: 'BenjaminVanRyseghem et CamilloBruni';
			timestamp: '2011-09-20 18:45:20'. 
			
		spec
			preLoadDoIt: #preload100 ].

	spec for: #'pharo' do: [
		spec 
			package: 'CI' with: 'CI-CamilloBruni.20'].