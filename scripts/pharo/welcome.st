WorldState addDeferredUIMessage: [
| welcomeWorkspace |
(World submorphs 
	select: [ :each | each isKindOf: SystemWindow ])
	do: #delete.  
welcomeWorkspace := Workspace new.
(welcomeWorkspace openLabel: 'Welcome')
	position: 260@150;
	extent: 500@380.
welcomeWorkspace contents: '"
Pharo 1.4
=======

Hello, fellow pharoer,

Pharo 1.4 comes with a whole set of packages you can use 
to explore the system and develop your own applications.
But maybe you need other stuff or feel more confortable using 
a tool you already know. 
To easily load projects, you can open the Configurations Browser 
(by executing the line below or opening the World menu and go 
to Tools, then Configuration Browser).
"

MetacelloConfigurationBrowser open.
' ]	