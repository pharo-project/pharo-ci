versions
version103: spec
	<version: '1.03' imports: #('1.02-baseline' )>

	spec for: #'common' do: [
		spec 
			blessing: #'development';
			description: '1.03: Load Slices and Update the Issue Tracker';
			author: 'BenjaminVanRyseghem et CamilloBruni';
			timestamp: '22 September 2011 7:42:22 pm'. 
			
		spec
			preLoadDoIt: #preload102 ].

	spec for: #'pharo' do: [
		spec 
			package: 'CI' with: 'CI-CamilloBruni.35';
			package: 'Soup-Core' with: 'Soup-Core-CamilloBruni.14';
			package: 'Soup-XPath' with: 'Soup-XPath-CamilloBruni.3'].