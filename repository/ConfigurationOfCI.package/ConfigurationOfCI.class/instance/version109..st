versions
version109: spec
	<version: '1.09' imports: #('1.02-baseline' )>

	spec for: #'common' do: [
		spec 
			blessing: #'development';
			description: '1.09: Stabilized Code';
			author: 'CamilloBruni';
			timestamp: '2011-12-13T16:52:14.363+01:00'. 
			
		spec
			preLoadDoIt: #preload107 ].

	spec for: #'pharo' do: [
		spec 
			package: 'CI' with: 'CI-MonkeyGalactikalIntegrator.89';
			package: 'Soup-Core' with: 'Soup-Core-CamilloBruni.14';
			package: 'Soup-XPath' with: 'Soup-XPath-CamilloBruni.3'].