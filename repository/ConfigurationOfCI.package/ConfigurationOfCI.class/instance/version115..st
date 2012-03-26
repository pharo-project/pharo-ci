versions
version115: spec
	<version: '1.15' imports: #('1.04-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'development'.
		spec description: 'New configuration (better dependencies) + split to have a minimal set into Pharo'.
		spec author: 'CamilloBruni'.
		spec timestamp: '3/26/2012 16:03'. ].

	spec for: #'pharo' do: [
		spec 
			package: 'CI-Core' with: 'CI-Core-BenjaminVanRyseghem.2';
			package: 'CI-Integration' with: 'CI-Integration-BenjaminVanRyseghem.2';
			package: 'CI-Loader' with: 'CI-Loader-BenjaminVanRyseghem.1';
			project: 'Soup' with: '1.2';
			package: 'Zodiac-Core' with: 'Zodiac-Core-SvenVanCaekenberghe.17'].
