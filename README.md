# Inject Docker Certificates -- Docker Native for Mac

## Is this you?

```
> docker pull somehost/some-image:latest
Error response from daemon: Get https://somehost/...: x509: certificate signed by unknown authority
```

![Feels bad man](https://s3-static-ak.buzzfed.com/static/2016-02/2/11/campaign_images/webdr04/are-you-actually-a-meme-bob-or-a-meme-snob-2-7455-1454431596-7_dblbig.jpg "Feels bad man")

## We got you covered!

You need to inject your ca into docker!

This solution is the SHOW ME THE MONEY version, since "easy" is not easy enough, we all have stuff to do and business to go about. But for reference, [this repo](https://github.com/gesellix/inject-docker-certs) is the original version with a complete guide and everything.

So,

1. Make sure the certificate you want inside the Docker native VM is in the current directory.
1. For good measure, make sure the certificate is valid: `openssl x509 -in klarna_ca.crt -text -noout`
1. build the image: `docker build -t inject-docker-certs .`
1. run the patch: `docker run --rm -it -v `pwd`:/certs -v /etc:/vm-etc -e CERTIFICATE=klarna_ca.crt inject-docker-certs`

Make sure `klarna_ca.crt` is replaced with whatever filename you might have.
