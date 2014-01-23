publishing
htmlEnding: aCIValidationResult
	self stream lf;
		<< '</div>'; lf;
		<< '<script>'; lf;
		<< self diffScript; lf;
		<< '</script>'; lf;
		<< '</body>'; lf;
		<< '</html>'; lf