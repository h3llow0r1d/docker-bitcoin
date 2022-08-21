#!/bin/bash

if [ ! -f /data/bitcoin.conf ]; then
	cat <<- 'EOF' > /data/bitcoin.conf
		
	EOF
fi

exec "$@"