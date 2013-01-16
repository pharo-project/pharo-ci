versions
version119: spec
	<version: '1.19' imports: #('1.06-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'command line handler'.
		spec author: 'CamilloBruni'.
		spec timestamp: '2012-12-04 23:25'. ].

	spec for: #'pharo' do: [
		spec 
			project: 'Soup' with: '1.2'.
		spec 
			package: 'FileSystem-Legacy' with: 'FileSystem-Legacy-CamilloBruni.1'.
		spec 
			package: 'CI-Core' with: 'CI-Core-MonkeyGalactikalIntegrator.45';
			package: 'CI-Integration' with: 'CI-Integration-CamilloBruni.22';
			package: 'CI-Loader' with: 'CI-Loader-CamilloBruni.6' ].
