printing
buildGreenTitleOn: aStream 
	|duration title|
	
	duration := testStopwatch duration.
	
	title :=  String streamContents: [ :s |
					s << testResult passed size asString << ' tests passed in '.
					s << (duration hours padded: #left to: 2 with: $0) << ':'.
					s << (duration minutes padded: #left to: 2 with: $0) << ':'.
					s << (duration seconds padded: #left to: 2 with: $0) << 's:'].
				
	aStream << title; lf.
	title size timesRepeat: [ aStream << '='].
	aStream lf.
	