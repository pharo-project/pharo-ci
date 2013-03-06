instance creation
fromXML: xml
 
	attachementName := (xml findTag: 'sfilename') children first text.
	url := (xml findTag: 'surl') children first text.