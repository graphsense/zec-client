install:
	git clone https://github.com/zcash/zcash.git src && \
	cd src && \
	git checkout tags/v2.0.3 -b local && \
	bash ./zcutil/fetch-params.sh && \
	bash ./zcutil/build.sh -j4 && \
	cd src && \
	install -s -c zcashd zcash-cli -t /usr/local/bin 
