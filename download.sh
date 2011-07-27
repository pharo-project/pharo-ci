# download resource from web url
# arguments:
# 1 - output
# 2 - url

CERTCHECK="--no-check-certificate"

# on macs wget is pretty old and not recognizing this option 

if [ `uname` == "Darwin" ]; then
	CERTCHECK=''
fi

wget -nv $CERTCHECK -O "$1" "$2"
