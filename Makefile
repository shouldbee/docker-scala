IMAGE := shouldbee/scala
LATEST := 2.11.1

build:
	docker build -t common common
	docker build -t $(IMAGE) $(LATEST)
	docker build -t $(IMAGE):2.10.4 2.10.4
	docker build -t $(IMAGE):2.11.1 2.11.1

test:
	docker run --rm $(IMAGE):latest java -version 2>&1 | grep 'java version "1.7.0'
	docker run --rm $(IMAGE):2.10.4 java -version 2>&1 | grep 'java version "1.7.0'
	docker run --rm $(IMAGE):2.11.1 java -version 2>&1 | grep 'java version "1.7.0'

	docker run --rm $(IMAGE):latest scala -version 2>&1 | grep "version $(LATEST) --"
	docker run --rm $(IMAGE):2.10.4 scala -version 2>&1 | grep "version 2.10.4 --"
	docker run --rm $(IMAGE):2.11.1 scala -version 2>&1 | grep "version 2.11.1 --"

	docker run --rm $(IMAGE):latest locale | grep LC_ALL=en_US.UTF-8
	docker run --rm $(IMAGE):2.10.4 locale | grep LC_ALL=en_US.UTF-8
	docker run --rm $(IMAGE):2.11.1 locale | grep LC_ALL=en_US.UTF-8

push:
	docker push $(IMAGE)
