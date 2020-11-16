install:
	git clone --depth=1 -b v4.1.0 https://github.com/zcash/zcash.git src && \
	cd src && \
	bash ./zcutil/fetch-params.sh && \
	bash ./zcutil/build.sh -j4 && \
	cd src && \
	install -s -c zcashd zcash-cli -t /usr/local/bin 
