helper parameters
publishJenkinsJobLink
	self stream 
		<< '<tr><td>Jenkins Job</td>'; 
		<< '<td><a href="'; << self buildUrl; <<'">';
		<< '<span class="label label-primary">'; << (Smalltalk os environment at: 'BUILD_TAG'); << '</span>';
		<< '</a></td></tr>'; lf