versions
version117: spec
	<version: '1.17' imports: #('1.04-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'development'.
		spec description: 'merge instead of load'.
		spec author: 'CamilloBruni'.
		spec timestamp: '8/8/2012 19:07'. ].

	spec for: #'pharo' do: [
		spec project: 'Soup' with: '1.2'.
		spec 
			package: 'CI-Core' with: 'CI-Core-CamilloBruni.29';
			package: 'CI-Integration' with: 'CI-Integration-BenjaminVanRyseghem.6';
			package: 'CI-Loader' with: 'CI-Loader-CamilloBruni.5';
			package: 'Zodiac-Core' with: 'Zodiac-Core-MarcusDenker.23'. ].
