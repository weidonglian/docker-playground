# How to handle the ssl certificate

## Generate the ssl certificate

```bash
cd cert
./self-signed-ssl
```

In Google Chrome, `settings` -> `Manage Certificate` -> `Authorities` -> `Import`, we can then import `CA.pem` to trust this certificate.

## Edit /etc/hosts

adding as below:

```bash
127.0.0.1 nginx.biosave.org
```

## start the server

```bash
docker-compose up --build nginx-ssl
```
