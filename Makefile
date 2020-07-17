LOCAL=rust:1.45.0-amazonlinux2018.03.0.20200602.1
REMOTE=ewbankkit/rust-amazonlinux:1.45.0-2018.03.0.20200602.1

.PHONY: all image push

all: push

image:
	docker build --file Dockerfile --tag ${LOCAL} .
	docker tag ${LOCAL} ${REMOTE}

# Don't forget to docker login.
push: image
	docker push ${REMOTE}
