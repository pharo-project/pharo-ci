versions
version101: spec
	<version: '1.0.1' imports: #('1.0-baseline')>

	spec for: #'pharo' do: [
		spec timestamp: '2014-09-24 16:08'.
		
		spec 
			project: 'CI' with: #'stable';
			package: 'CI-Integration-GUI' with: 'CI-Integration-GUI-EstebanLorenzano.4' ]