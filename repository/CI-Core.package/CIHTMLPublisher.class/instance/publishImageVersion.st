helper parameters
publishImageVersion
	| version |
	version := SystemVersion current.
	self stream 
		<< '<tr><td>Image Version</td>'; 
		<< '<td><a href="http://files.pharo.org/image/'; << (version majorMinor: ''); << '/'; print: version highestUpdate; <<'.zip">';
		<< '<span class="label label-primary">'; print: version highestUpdate; << '</span>';
		<< '</a></td></tr>'; lf