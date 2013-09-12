versions
versionDevelopmentBleedingEdge: spec
	<version: '999-devBleedingEdge' imports: #('999-dev-baseline')>

	spec for: #'common' do: [
		self versionDevelopmentExternal: spec.  ].
