versions
versionDevelopment: spec
	<version: 'dev' imports: #('dev-baseline')>

	spec for: #'common' do: [
		spec timestamp: 'CamilloBruni 4/10/2013 16:43'.
		
		self versionDevelopmentExternal: spec. 
		spec 
			"ErwanDouaille CamilloBruni"
			package: 'CI-Core'               with: 'CI-Core-CamilloBruni.279';
			package: 'CI-FogBugzAPI'         with: 'CI-FogBugzAPI-CamilloBruni.37';
			package: 'CI-Integration'        with: 'CI-Integration-CamilloBruni.57';
			package: 'CI-Loader'             with: 'CI-Loader-CamilloBruni.6';
			package: 'CI-GoogleIssueTracker' with: 'CI-GoogleIssueTracker-CamilloBruni.2' ].
