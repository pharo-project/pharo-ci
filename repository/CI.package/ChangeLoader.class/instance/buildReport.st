printing
buildReport
	| testedClasses |
	testedClasses := testResult passed collect: [:each | each class ].
	testedClasses := testedClasses asSet asArray sort: [:a :b | a name < b name ].

	^ String streamContents: [:stream |
		testedClasses ifNotEmpty: [:collection |
			stream << 'Classes tested (' << collection size <<'):'; lf.
			collection do: [:e | stream tab << '- ' << e printString. stream lf ]]]