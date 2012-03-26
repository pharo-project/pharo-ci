versions
version105: spec
	<version: '1.05' imports: #('1.02-baseline' )>

	spec for: #'common' do: [
		spec 
			blessing: #'development';
			description: '1.05: With VM and Image version numbers in the error report';
			author: 'BenjaminVanRyseghem et CamilloBruni';
			timestamp: '24 September 2011 1:34:55 pm'. 
			
		spec
			preLoadDoIt: #preload102 ].

	spec for: #'pharo' do: [
		spec 
			package: 'CI' with: 'CI-MonkeyGalactikalIntegrator.51';
			package: 'Soup-Core' with: 'Soup-Core-CamilloBruni.14';
			package: 'Soup-XPath' with: 'Soup-XPath-CamilloBruni.3'].