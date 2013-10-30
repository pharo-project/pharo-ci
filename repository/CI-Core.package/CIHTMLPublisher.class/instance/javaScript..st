publishing
javaScript: scriptFileName
	
	self stream 
		<< '<script src="' << self bootstrapRoot << 'js/' << scriptFileName << '"></script>'; lf