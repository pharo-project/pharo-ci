helper parameters
publishAdditionalParameters
	self additionalParemeters keysAndValuesDo: [ :name :description |
		self stream 
			<< '<tr><td>'; 
			<< name asString; 
			<< '</td><td>';
			<< description asString; 
			<< '</td></tr>'; lf ]