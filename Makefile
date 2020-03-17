LOCAL=rust:1.41.1-amazonlinux2018.03.0.20191219.0
REMOTE=ewbankkit/rust-amazonlinux:1.41.1-2018.03.0.20191219.0

.PHONY: all image push

all: push

image:
	docker build --file Dockerfile --tag ${LOCAL} .
	docker tag ${LOCAL} ${REMOTE}

# Don't forget to docker login.
push: image
	docker push ${REMOTE}
