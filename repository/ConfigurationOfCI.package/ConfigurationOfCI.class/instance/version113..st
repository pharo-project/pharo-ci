versions
version113: spec
	<version: '1.13' imports: #('1.03-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'development'.
		spec description: ''.
		spec preLoadDoIt: #'preload107'.
		spec author: 'CamilloBruni'.
		spec timestamp: '1/20/2012 20:34'. ].

	spec for: #'pharo' do: [
		spec 
			package: 'CI' with: 'CI-CamilloBruni.94';
			package: 'Soup-Core' with: 'Soup-Core-CamilloBruni.14';
			package: 'Soup-XPath' with: 'Soup-XPath-CamilloBruni.3'. ].