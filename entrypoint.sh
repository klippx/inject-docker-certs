#!/bin/sh

openssl verify -verbose -CAfile /vm-etc/ssl/certs/ca-certificates.crt /certs/${CERTIFICATE}
CA_CERT_EXISTS=$?
if [ $CA_CERT_EXISTS -ne 0 ]; then
  echo "adding ${CERTIFICATE} to /vm-etc/ssl/certs/ca-certificates.crt"
  cat /certs/${CERTIFICATE} >> /vm-etc/ssl/certs/ca-certificates.crt
else
  echo "${CERTIFICATE} is already added to VM CAs"
fi
