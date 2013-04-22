publishing
publishChangeNotFound: aChange
	VTermOutputDriver stderr color256: Color orange; <<(aChange name asString, ' >> no changes has been found') asString; flush; clear; lf.