publishing
javaScript: scriptFileName
	
	self stream 
		<< '<script src="' << self htmlResourcesUrl << 'js/' << scriptFileName << '"></script>'; lf