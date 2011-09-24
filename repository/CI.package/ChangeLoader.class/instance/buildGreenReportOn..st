printing
buildGreenReportOn: stream

	| testedClasses packages title |
	
	testResult ifNil: [ ^ self ].
	testedClasses := testResult passed collect: [:each | each class].
	testedClasses ifEmpty: [ ^ self ].
	
	packages := Dictionary new.
	testedClasses do: [ :testClass|
		packages at: testClass package name put: (packages at: testClass package name ifAbsent: [ 0 ]) + 1 ].
	
	title := 'Tests passed (', testedClasses size asString , ') in ', testStopwatch duration asString, ' :'.
	stream << title; lf.
	title size timesRepeat: [ stream << '='].
	stream lf.
	
	packages keys asArray sort do: [ :package|
		stream tab << package << ' (' << (packages at: package) << ')'; lf].
	
	stream lf.
	self printSetupDescriptionOn: stream.