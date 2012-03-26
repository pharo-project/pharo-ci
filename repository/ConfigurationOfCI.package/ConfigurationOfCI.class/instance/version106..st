versions
version106: spec
	<version: '1.06' imports: #('1.02-baseline' )>

	spec for: #'common' do: [
		spec 
			blessing: #'development';
			description: '1.06: With all tests and report on invalid sources';
			author: 'BenjaminVanRyseghem et CamilloBruni';
			timestamp: '25 September 2011 5:10:55 pm'. 
			
		spec
			preLoadDoIt: #preload102 ].

	spec for: #'pharo' do: [
		spec 
			package: 'CI' with: 'CI-Integrator.82';
			package: 'Soup-Core' with: 'Soup-Core-CamilloBruni.14';
			package: 'Soup-XPath' with: 'Soup-XPath-CamilloBruni.3'].