versions
version118: spec
	<version: '1.18' imports: #('1.05-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'no need to install Zinc (supposely)'.
		spec author: 'EstebanLorenzano'.
		spec timestamp: '24 September 2012 12:58:31 pm'. ].

	spec for: #'pharo' do: [
		spec project: 'Soup' with: '1.2'.
		spec 
			package: 'CI-Core' with: 'CI-Core-EstebanLorenzano.41';
			package: 'CI-Integration' with: 'CI-Integration-EstebanLorenzano.10';
			package: 'CI-Loader' with: 'CI-Loader-CamilloBruni.5' ].
