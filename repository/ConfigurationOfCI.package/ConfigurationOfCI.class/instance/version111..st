versions
version111: spec
	<version: '1.11' imports: #('1.03-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'development'.
		spec description: '1.09: Stabilized Code'.
		spec author: 'CamilloBruni'.
		spec timestamp: '2011-12-16T16:57:22.777+01:00'. 
		spec preLoadDoIt: #preload107 ].

	spec for: #'pharo' do: [
		spec 
			package: 'CI' with: 'CI-MonkeyGalactikalIntegrator.92';
			package: 'Soup-Core' with: 'Soup-Core-CamilloBruni.14';
			package: 'Soup-XPath' with: 'Soup-XPath-CamilloBruni.3'].