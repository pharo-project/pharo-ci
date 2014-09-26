versions
version10: spec
	<version: '1.0' imports: #('1.0-baseline')>

	spec for: #'pharo' do: [
		spec timestamp: '2014-09-24 15:10'.
		
		spec 
			project: 'CI' with: #'stable';
			package: 'CI-Integration-GUI' with: 'CI-Integration-GUI-EstebanLorenzano.3' ]