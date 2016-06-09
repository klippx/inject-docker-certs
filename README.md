# Inject Docker Certificates -- Docker Native for Mac

Visit [this repo](https://github.com/gesellix/inject-docker-certs) for a complete and easy guide.

This repo is the SHOW ME THE MONEY version, since "easy" is not easy enough, we all have stuff to do and business to go about.

So,

1. Make sure the certificate you want inside the Docker native VM is in the current directory.
1. For good measure, make sure the certificate is valid: `openssl x509 -in klarna_ca.crt -text -noout`
1. build the image: `docker build -t inject-docker-certs .`
1. run the patch: `docker run --rm -it -v `pwd`:/certs -v /etc:/vm-etc -e CERTIFICATE=klarna_ca.crt inject-docker-certs`

Make sure `klarna_ca.crt` is replaved to whatever name you have for your CA file.
