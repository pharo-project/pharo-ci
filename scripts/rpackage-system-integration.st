"load rpackage"
Gofer new
		squeaksource: 'PharoTaskForces';
		package: 'ConfigurationOfRPackage';
		load.

((ConfigurationOfRPackage project version: #development) load).
   "to be sure that the organizer is initialized before loading anything else:"

"(Smalltalk globals at: #RPackageOrganizer) initializeDefault."
(Smalltalk globals at: #RPackageOrganizer )  removeMockPackagesFromOldOrganizer.

Gofer new
		squeaksource: 'DelaunayTmpStuffs';
		version: 'Monticello-cyrilledelaunay.521';
		merge.

Gofer new
		squeaksource: 'DelaunayTmpStuffs';
		version: 'MonticelloGUI-cyrilledelaunay.89';
		merge.
		
Gofer new
		squeaksource: 'DelaunayTmpStuffs';
		version: 'Tests-cyrilledelaunay.288';
		merge.
		
Gofer new
		squeaksource: 'DelaunayTmpStuffs';
		version: 'ScriptLoader13-cyrilledelaunay.199';
		merge.
		
Gofer new
		squeaksource: 'DelaunayTmpStuffs';
		version: 'Gofer-Core-cyrilledelaunay.131';
		merge.
Gofer new
		squeaksource: 'DelaunayTmpStuffs';
		version: 'Gofer-Tests-cyrilledelaunay.130';
		merge.
Gofer new
		squeaksource: 'DelaunayTmpStuffs';
		version: 'SUnit-cyrilledelaunay.40136';
		merge.
		
"Gofer new
		squeaksource: 'DelaunayTmpStuffs';
		version: 'SUnitGUI-cyrilledelaunay.72';
		merge."
		
Gofer new
		squeaksource: 'DelaunayTmpStuffs';
		version: 'System-Settings-cyrilledelaunay.216';
		merge.
		
Gofer new
		squeaksource: 'DelaunayTmpStuffs';
		version: 'FixUnderscores-cyrilledelaunay.22';
		merge.
		
Gofer new
		squeaksource: 'DelaunayTmpStuffs';
		version: 'HelpSystem-Core-cyrilledelaunay.77';
		merge.

Gofer new
		squeaksource: 'DelaunayTmpStuffs';
		version: 'Metacello-Help-cyrilledelaunay.12';
		merge.
		
Gofer new
		squeaksource: 'DelaunayTmpStuffs';
		version: 'Metacello-ToolBox-cyrilledelaunay.88';
		merge.


"Gofer new
		squeaksource: 'DelaunayTmpStuffs';
		version: 'SUnitGUI-cyrilledelaunay.80';
		merge."
		
Gofer new
		squeaksource: 'DelaunayTmpStuffs';
		version: 'System-Installers-cyrilledelaunay.12';
		merge.
		
Gofer new
		squeaksource: 'DelaunayTmpStuffs';
		version: 'System-Settings-cyrilledelaunay.216';
		merge.
		
Gofer new
		squeaksource: 'DelaunayTmpStuffs';
		version: 'System-Support-cyrilledelaunay.493';
		merge.