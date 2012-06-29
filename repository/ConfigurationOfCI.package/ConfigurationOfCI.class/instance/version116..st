versions
version116: spec
	<version: '1.16' imports: #('1.04-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'development'.
		spec description: 'fixing missing extensions'.
		spec author: 'Benjamin Stef'.
		spec timestamp: 'Integrator 6/21/2012 18:08' ].

	spec for: #'pharo' do: [
		spec 
			package: 'CI-Core' with: 'CI-Core-Integrator.6';
			package: 'CI-Integration' with: 'CI-Integration-Integrator.5';
			package: 'CI-Loader' with: 'CI-Loader-BenjaminVanRyseghem.2';
			project: 'Soup' with: '1.2';
			package: 'Zodiac-Core' with: 'Zodiac-Core-SvenVanCaekenberghe.17'].
