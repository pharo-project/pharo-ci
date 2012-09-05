versions
version117: spec
	<version: '1.18' imports: #('1.04-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'development'.
		spec description: 'added debug'.
		spec author: 'CamilloBruni'.
		spec timestamp: '9/5/2012 15:34'. ].

	spec for: #'pharo' do: [
		spec project: 'Soup' with: '1.2'.
		spec 
			package: 'CI-Core' with: 'CI-Core-CamilloBruni.30';
			package: 'CI-Integration' with: 'CI-Integration-BenjaminVanRyseghem.6';
			package: 'CI-Loader' with: 'CI-Loader-CamilloBruni.5';
			package: 'Zodiac-Core' with: 'Zodiac-Core-MarcusDenker.23'. ].
