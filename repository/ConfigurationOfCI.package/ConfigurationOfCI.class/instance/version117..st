versions
version117: spec
	<version: '1.17' imports: #('1.04-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'development'.
		spec description: 'cleaning up merge mess'.
		spec author: 'CAmilloBruni'.
		spec timestamp: '7/19/2012 15:55'. ].

	spec for: #'pharo' do: [
		spec project: 'Soup' with: '1.2'.
		spec 
			package: 'CI-Core' with: 'CI-Core-CAmilloBruni.28';
			package: 'CI-Integration' with: 'CI-Integration-Integrator.5';
			package: 'CI-Loader' with: 'CI-Loader-CAmilloBruni.4';
			package: 'Zodiac-Core' with: 'Zodiac-Core-MarcusDenker.23'. ].
