This directory contains a set of scripts to download the latest Pharo VMs 
and Images.

The contents of this folder are stored in a git repository[1] and regularly 
synched by a Jenkins job[2].

Examples:

	# Typically the scripts are curl'ed and directly piped to bash to avoid an
	# intermediate file:
	curl -L http://files.pharo.org/script/ciPharo20.sh | bash
	
	# Alternatively wget works as well:
	wget --quiet -O - http://files.pharo.org/script/ciPharo20.sh | bash

	# Each script comes with a help file describing the generated artifacts:
	wget http://files.pharo.org/script/ciPharo20.sh;
	bash ciPharo20.sh --help

[1] https://gitorious.org/pharo-build/pharo-build
[2] https://ci.inria.fr/pharo/job/Scripts-download/
