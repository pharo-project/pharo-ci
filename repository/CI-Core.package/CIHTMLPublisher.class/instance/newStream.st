initialization
newStream
	
	self stream: (self outputDirectory / self fileName, 'html') ensureDelete writeStream.