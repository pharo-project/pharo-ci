helper parameters
publishJenkinsJobLink
	self stream 
		<< '<tr><td>Image Version</td>'; 
		<< '<td><a href="'; << (Smalltalk os environment at: 'BUILD_URL'); <<'">';
		<< '<span class="label label-primary">'; << (Smalltalk os environment at: 'BUILD_TAG'); << '</span>';
		<< '</a></td></tr>'; lf