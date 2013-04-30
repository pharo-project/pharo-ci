versions
version121: spec
	<version: '1.21' imports: #('1.07-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'development'.
		spec timestamp: 'CamilloBruni 4/10/2013 16:43'. ].

	spec for: #'pharo' do: [
		spec 
			project: 'Soup' with: '1.2';
			project: 'ConfigurationOfCommandShell' with: '1.1';
			project: 'FuelMetalevel' with: #stable;
			project: 'Zinc' with: #stable.
		spec 
			package: 'FileSystem-Legacy' with: 'FileSystem-Legacy-CamilloBruni.1'.
		spec 
			"ErwanDouaille"
			package: 'CI-Core' with: 'CI-Core-CamilloBruni.178';
			package: 'CI-Integration' with: 'CI-Integration-CamilloBruni.49';
			package: 'CI-Loader' with: 'CI-Loader-CamilloBruni.6';
			package: 'CI-FogBugzAPI' with: 'CI-FogBugzAPI-CamilloBruni.33';
			package: 'CI-GoogleIssueTracker' with: 'CI-GoogleIssueTracker-CamilloBruni.2' ].
