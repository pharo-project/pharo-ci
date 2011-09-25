printing
buildGreenReportOn: stream

	| packages |
	
	testResult ifNil: [ ^ self ].
	
	"count the number of tests per package"
	packages := Dictionary new.
	testResult passed do: [ :testCase| | package |
		package := testCase class category.
		packages at: package put: (packages at: package ifAbsent: [ 0 ]) + 1 ].
	
	packages keys asArray sort do: [ :package|
		stream tab << package << ' (' << (packages at: package) << ')'; lf].
	
	stream lf.
	self buildSetupDescriptionOn: stream.