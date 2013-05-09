versions
version120: spec
	<version: '1.20' imports: #('1.06-baseline')>

	spec for: #'common' do: [
		spec 
			description: 'command line handler';
			author: 'CamilloBruni';
			timestamp: '1/28/2013 17:55'.
		
		spec 
			project: 'Soup' with: '1.2'.
		spec 
			package: 'FileSystem-Legacy' with: 'FileSystem-Legacy-CamilloBruni.1'.
		spec 
			package: 'CI-Core'        with: 'CI-Core-CamilloBruni.57';
			package: 'CI-Integration' with: 'CI-Integration-CamilloBruni.32';
			package: 'CI-Loader'      with: 'CI-Loader-CamilloBruni.6' ].
