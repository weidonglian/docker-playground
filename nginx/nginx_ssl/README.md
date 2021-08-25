# How to handle the ssl certificate

## Generate the ssl certificate

Run the `self-signed-ssl` as below and it will prompt and guide you how to input required fields. 

- Common Name, i.e. CN=biosave.org
- Subject Alternative Name, i.e. SAN=*.biosave.org

```bash
cd cert
./self-signed-ssl
```
In production, we should use `Let's Encrypt` or `GoDaddy` or `AWS` to help us generate a certificate with Trusted Issuer. Yes, it is not free.

## How to use the certificate

Since it is self-signed certificate, Chrome will show up a warning when access a website server with a self-signed certificate. We can tell Chrome to trust my certificate as below: 

In Google Chrome, `settings` -> `Manage Certificate` -> `Authorities` -> `Import`, we can then import `CA.pem` to trust this certificate.

Then the self-signed certificate will be treated as trusted one when you access the website from Chrome and there won't be any warning.

In production, when running kubernetes, the `cert-manager` will help us manage the certifcate and generate secret.

## Edit /etc/hosts on Linux/Mac

adding as below, this will resolve `nginx.biosave.org` as `localhost` when you try to access https://nginx.biosave.org in Chrome:

```bash
127.0.0.1 nginx.biosave.org
```
In production, you can configure this in your GCP's cloud DNS or AWS's Route53. If you run kubernetes, this can be handled automatically by `external-dns`. 

On windows, changing host is also possible. Google that:)

## start the server

```bash
docker-compose up --build nginx-ssl
```

Now we are able to test how to setup a ssl server and a certificate. 
