publishing
htmlBeginning: aCIValidationResult
	self stream
		<< '<!DOCTYPE html>'; lf;
		<< '<html lang="en">'; lf;
		<< '<head>'; lf;
		<< '<title>Validation Report: ';
		<< (aCIValidationResult change id ifNil: [ '' ]) asString; space;
		<< aCIValidationResult change name asString; 
		<< ' -- Test report</title>'; lf;
		<< '<link href="'; << self bootstrapRoot; << 'css/bootstrap.css" rel="stylesheet">';
		<< '</head>'; lf;
		<< '<body>'; lf;
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