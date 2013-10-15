publishing
htmlBeginning: aCIValidationResult
	self stream
		nextPutAll: '<?xml version="1.0" encoding="UTF-8"?>'; lf;
		nextPutAll: '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">'; lf;
		nextPutAll: '<html>'; lf;
		nextPutAll: '<head>'; lf;
		nextPutAll: '<title>';
		nextPutAll: aCIValidationResult change name asString; 
		nextPutAll: ' -- Test report</title>'; lf;
		nextPutAll: '</head>'; lf;
		nextPutAll: '<body>'.

	aCIValidationResult change url ifNil: [ 
		self stream
			nextPutAll: '<h1>';
			nextPutAll: aCIValidationResult change name asString; nextPutAll: ' -- Test report</h1>'; lf.
		^ self ].
	
	self stream lf;
		nextPutAll: '<h1><a href="'; nextPutAll: aCIValidationResult change url; nextPutAll:'">';
		nextPutAll: aCIValidationResult change name asString; nextPutAll: ' -- Test report';
		nextPutAll: '</a></h1>'; lf.