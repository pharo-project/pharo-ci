versions
versionDevelopmentBleedingEdge: spec
	<version: 'devBleedingEdge' imports: #('dev-baseline')>

	spec for: #'common' do: [
		self versionDevelopmentExternal: spec.  ].
