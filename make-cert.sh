-rm -f *.pem
openssl genrsa -out key.pem 2048
openssl req -new -key key.pem -out csr.pem
openssl x509 -req -in csr.pem -signkey key.pem -out cert.pem
-rm -f csr.pem
