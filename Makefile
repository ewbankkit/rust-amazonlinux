LOCAL_AL=rust:1.48.0-amazonlinux2018.03.0.20200602.1
REMOTE_AL=ewbankkit/rust-amazonlinux:1.48.0-2018.03.0.20200602.1
LOCAL_AL2=rust:1.48.0-amazonlinux2.0.20200722.0
REMOTE_AL2=ewbankkit/rust-amazonlinux:1.48.0-2.0.20200722.0

.PHONY: all image_al push_al image_al2 push_al2

all: push_al push_al2

image_al:
	docker build --file Dockerfile.al --tag ${LOCAL_AL} .
	docker tag ${LOCAL_AL} ${REMOTE_AL}

# Don't forget to docker login.
push_al: image_al
	docker push ${REMOTE_AL}

image_al2:
	docker build --file Dockerfile.al2 --tag ${LOCAL_AL2} .
	docker tag ${LOCAL_AL2} ${REMOTE_AL2}

# Don't forget to docker login.
push_al2: image_al2
	docker push ${REMOTE_AL2}
