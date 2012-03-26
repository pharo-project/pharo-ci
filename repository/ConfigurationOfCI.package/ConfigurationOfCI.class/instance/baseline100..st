baselines
baseline100: spec 
	<version: '1.00-baseline'>
	
	spec for: #common do: [
		spec blessing: #baseline.
	].	
		
	spec for: #pharo do: [
		spec blessing: #baseline.
		spec repository: 'http://www.squeaksource.com/ci'.
		spec package: 'CI'.]