preload
preloadZincHTTPComponents
	" Because Camillo does not know that configuration exists, he is using alpha code"

	Gofer new
		squeaksource: 'Zodiac';
		package: 'Zodiac-Core';
		load.

	{ 'Zinc-HTTP'. 'Zinc-Patch-HTTPSocket'. 'Zinc-Tests'. 'Zinc-AWS'. 'Zinc-Old'.'Zinc-REST'.'Zinc-Zodiac'} do: [:packageName |
			Gofer new
				squeaksource: 'ZincHTTPComponents';
				package: packageName;
				load].
	
	"replace the default zinc client by the Zodioc version which has ssl support"
	ZnNetworkingUtils default: ZnZodiacNetworkingUtils new.