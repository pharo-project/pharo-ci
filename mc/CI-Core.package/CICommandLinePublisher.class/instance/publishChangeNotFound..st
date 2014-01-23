publishing
publishChangeNotFound: aChange
	VTermOutputDriver stderr 
		color256: Color orange; 
		<< 'Could not find changes'; 
		flush; clear; lf.