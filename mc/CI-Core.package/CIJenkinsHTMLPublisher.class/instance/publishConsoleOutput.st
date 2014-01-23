helper
publishConsoleOutput
	
	self stream 
		<< '<h2>Console Output</h2>';
		<< '<div class="well">'; lf;
		<< '<iframe src="'; << self buildUrl; << '/consoleText" style="width:100%; min-height:300px; border:none;"></iframe>'; lf;
		<< '</div>'.