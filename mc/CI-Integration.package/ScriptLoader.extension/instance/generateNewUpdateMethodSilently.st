*CI-Integration
generateNewUpdateMethodSilently
	"ScriptLoader new generateNewUpdateMethod"
	
	| str mthName preamble postscript |
	str := ReadWriteStream on: (String new: 1000).
	mthName := 'update', self currentUpdateVersionNumber asString.
	str nextPutAll: mthName ; cr  ; tab.
	str nextPutAll: '"self new ', mthName, '"'; crtab. 
	preamble := IntegrationManager uniqueInstance preLoadScript reset contents asString.
	
	str nextPutAll: 'self withUpdateLog: ' ; nextPut: $'; nextPutAll: self commentForCurrentUpdate ; nextPut: $'; nextPut: $. .
	str crtab.
	str nextPutAll: 'self script' , self currentScriptVersionNumber asString, '.'.
	str crtab.
	postscript := IntegrationManager uniqueInstance postLoadScript reset contents asString.
	postscript isEmptyOrNil ifFalse: [str nextPutAll: postscript; ensureEndsWith: $.; crtab].
	str nextPutAll: 'self flushCaches.'; cr.
	
	^ str contents