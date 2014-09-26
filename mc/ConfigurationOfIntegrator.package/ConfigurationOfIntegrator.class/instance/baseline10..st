baselines
baseline10: spec
	<version: '1.0-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://smalltalkhub.com/mc/Pharo/ci/main'.
		
		self ci: spec.
		spec package: 'CI-Integration-GUI' with: [ spec requires: 'CI' ] ].
