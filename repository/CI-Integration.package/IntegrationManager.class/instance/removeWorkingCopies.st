private
removeWorkingCopies

	| packageNamePrefixes copy |
	packageNamePrefixes := { 'CI'. 'ConfigurationOfContinousIntegration'. 'Soup'. 'OSProcess' }.
	copy := MCWorkingCopy allInstances select: [: each | packageNamePrefixes anySatisfy: [:prefix | each package name beginsWith: prefix ]].
	copy do: #unregister.