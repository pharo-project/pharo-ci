private
loadDefaultConfiguration
	"Try to find a valid configuration in a repository
	1. use the repository name to deduce a valid configuration name
	2. or check all packages in the repository and use the single package starting with ConfigurationOf.."
	self shouldBeImplemented