versions
versionDevelopment: spec
	<version: '999-dev' imports: #('999-dev-baseline')>

	spec for: #'common' do: [
		spec timestamp: 'CamilloBruni 2013-08-26'.
		
		self versionDevelopmentExternal: spec. 
		spec 
			"ErwanDouaille CamilloBruni"
			package: 'CI-Core'               with: 'CI-Core-CamilloBruni.467';
			package: 'CI-FogBugzAPI'         with: 'CI-FogBugzAPI-CamilloBruni.50';
			package: 'CI-Integration'        with: 'CI-Integration-CamilloBruni.79';
			package: 'CI-Loader'             with: 'CI-Loader-CamilloBruni.6';
			package: 'CI-GoogleIssueTracker' with: 'CI-GoogleIssueTracker-CamilloBruni.2' ].
