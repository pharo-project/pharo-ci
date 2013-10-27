publishing
htmlBeginning: aCIValidationResult
	self stream
		<< '<?xml version="1.0" encoding="UTF-8"?>'; lf;
		<< '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">'; lf;
		<< '<html>'; lf;
		<< '<head>'; lf;
		<< '<title>Validation Report: ';
		<< (aCIValidationResult change id ifNil: [ '' ]) asString; space;
		<< aCIValidationResult change name asString; 
		<< ' -- Test report</title>'; lf;
		<< '<link href="'; << self bootstrapRoot; << 'css/bootstrap.min.css" rel="stylesheet" media="screen">';
		<< '</head>'; lf;
		<< '<body>'; lf;
		<< '<script src="'; << self bootstrapRoot; << 'js/jquery-1.10.2.min.js"></script>'; lf;
 		<< '<script src="'; << self bootstrapRoot; << 'js/bootstrap.min.js"></script>'; lf;
		<< '<div class="container">';lf.

	aCIValidationResult change url ifNil: [ 
		self stream
			<< '<h1>Validation Report: ';
			<< (aCIValidationResult change id ifNil: [ '' ]) asString; space;
			<< aCIValidationResult change name asString; << '</h1>'; lf.
		^ self ].
	
	self stream lf;
		<< '<h1>Validation Report: <a href="'; << aCIValidationResult change url; <<'">';
		<< (aCIValidationResult change id ifNil: [ '' ]) asString; space;
		<< aCIValidationResult change name asString;
		<< '</a></h1>'; lf.