"Run Fuel Tests"
[ HDTestReport runPackages: ConfigurationOfFuel testsCategoriesForHudson ]
	on: Deprecation
	do: [ :err | err resume ]
