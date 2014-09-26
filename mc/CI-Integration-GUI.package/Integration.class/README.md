I'm an integration for automated processing pharo updates.
My intent is to remplace the manual process we use today. 
So, basically, I keep  a lists of issues, configurations, postLoad and preLoad scripts to integrate. 

You execute me doing something like this:

Integration new 
	issues: { 12345. 12346 };
	configurations: { ConfigurationOfGlamour -> '1.0.42' };
	preLoad: ' "here some preload script" ';
	postLoad: ' "here some post load script"  ';
	execute. 
	
The real complication is in #execute method (just take a look at it :P). 
It does all the things that previously where a manual process: 

1) it prepares the environment (updating github updates repository and download latest image)
2) It generates a pharo script to actually perform the integration
3) It executes the integration into a separated image. This process generates a set of monticello packages and an update script. 
Also it upload the monticello packages to proper inbox. 
4) it publishes the changes  (it is just a hit push).

pretty cool, isn't?
(specially if you think that before, you were doing all this manually)
