integration-private
statusUpdateXML: aMessage
	^ '<?xml version="1.0" encoding="UTF-8"?>
<entry xmlns="http://www.w3.org/2005/Atom" xmlns:issues="http://schemas.google.com/projecthosting/issues/2009">
  <content type="html">', aMessage, '</content>
  <author>
    <name>',self tracker user email,'</name>
  </author>
  <issues:updates>
    <issues:status>', self status, '</issues:status>
  </issues:updates>
</entry>'