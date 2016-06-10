#!/bin/sh

openssl verify -verbose -CAfile /vm-etc/ssl/certs/ca-certificates.crt /certs/${CERTIFICATE}

echo "adding ${CERTIFICATE} to /vm-etc/ssl/certs/ca-certificates.crt"
cat /certs/${CERTIFICATE} >> /vm-etc/ssl/certs/ca-certificates.crt
