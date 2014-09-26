versions
version133: spec
	<version: '1.33' imports: #('1.3-baseline')>

	spec for: #'common' do: [
		spec timestamp: 'BenjaminVanRyseghem 6 March 2014 5:21 pm'.
		
		spec 
			project: 'Soup'          with: '1.2';
			project: 'CommandShell'  with: '1.1';
			project: 'XMLWriter'     with: #stable.
		
		spec 
			"ErwanDouaille CamilloBruni BenjaminVanRyseghem"
			package: 'CI-Core'               with: 'CI-Core-BenjaminVanRyseghem.476';
			package: 'CI-FogBugzAPI'         with: 'CI-FogBugzAPI-BenjaminVanRyseghem.51';
			package: 'CI-Integration'        with: 'CI-Integration-BenjaminVanRyseghem.86';
			package: 'CI-Loader'             with: 'CI-Loader-CamilloBruni.6';
			package: 'CI-GoogleIssueTracker' with: 'CI-GoogleIssueTracker-CamilloBruni.2' ].
