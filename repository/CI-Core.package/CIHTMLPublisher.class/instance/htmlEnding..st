publishing
htmlEnding: aCIValidationResult
	self stream lf;
		<< '</div>'; lf;
		<< '<script src="'; << self bootstrapRoot; << 'js/jquery-1.10.2.min.js"></script>'; lf;
 		<< '<script src="'; << self bootstrapRoot; << 'js/bootstrap.js"></script>'; lf;
		<< '</body>'; lf;
		<< '</html>'; lf