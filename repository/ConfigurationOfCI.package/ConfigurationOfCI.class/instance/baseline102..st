baselines
baseline102: spec
	<version: '1.02-baseline'>

	spec for: #pharo do: [
		spec blessing: #baseline.
		spec repository: 'http://www.squeaksource.com/Soup'.
		spec package: 'Soup-Core'.
		
		spec repository: 'http://smalltalkhub.com/mc/Pharo/ci/main'.
		spec package:  'CI' with: [
			spec requires: 'Soup-Core']]