#!/bin/sh

echo "adding ${CERTIFICATE} to /vm-etc/ssl/certs/ca-certificates.crt"
cat /certs/${CERTIFICATE} >> /vm-etc/ssl/certs/ca-certificates.crt
