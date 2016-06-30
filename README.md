# Inject Docker Certificates -- Docker Native for Mac

## Is this you?

```
> docker pull somehost/some-image:latest
Error response from daemon: Get https://somehost/...: x509: certificate signed by unknown authority
```

## We got you covered!

To solve this, you want to inject your certificate into the docker xhyve VM.

So,

1. Make sure the certificate you want inside the Docker native VM is in the current directory.
1. For good measure, make sure the certificate is valid: `openssl x509 -in ./klarna_ca.crt -text -noout`
1. build the image: `docker build -t inject-docker-certs .`
1. run the patch: ```docker run --rm -it -v `pwd`:/certs -v /etc:/vm-etc -e CERTIFICATE=klarna_ca.crt inject-docker-certs```
1. restart docker 

Make sure `klarna_ca.crt` is replaced with whatever filename you might have.
