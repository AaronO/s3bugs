# s3bugs

Bugs with amazons aws cli

## Testing

Run `server.sh` in one terminal then `test.sh`.

`test.sh` will download the file with `aws s3` and `curl`, compare their hashes to detect corruption.

## Corrupted data

The tricky thing is, data is not always corrupted. But we have a `tar.gz` file that does. You can see it at `data/sample.tgz`.

### Tests

Results of tests I ran:

#### With aws-cli 1.7.1

```
❯ aws --version && ./test.sh
aws-cli/1.7.1 Python/2.7.10 Darwin/15.6.0
download: s3://data/sample.tgz to ./sample.s3.tgz
download: s3://data/57593bc91d236d0500b4393d.tgz to ./57593bc91d236d0500b4393d.s3.tgz
## Hashed files:
-rw-r--r--  1 aaron  staff    17M Jun  9 12:07 57593bc91d236d0500b4393d.curl.tgz
-rw-r--r--  1 aaron  staff    24M Jun  9 12:07 57593bc91d236d0500b4393d.s3.tgz
-rw-r--r--  1 aaron  staff    16M Jun  9 12:07 sample.curl.tgz
-rw-r--r--  1 aaron  staff    23M Jun  9 12:07 sample.s3.tgz
c4651a13e4f93a8bf36b094614fbe97cd484341b  57593bc91d236d0500b4393d.curl.tgz
c42aa1cfc28a41d72db5c83f4bd8a8494254b2ac  57593bc91d236d0500b4393d.s3.tgz
c8ade21035760ea622c25a1cc9bdabb6d6cfb14c  sample.curl.tgz
5ac6d976e94f661a742980be57431df2d0ad295d  sample.s3.tgz

## Original:
-rw-r--r--  1 aaron  staff    17M Jun  9 12:00 57593bc91d236d0500b4393d.tgz
-rw-r--r--  1 aaron  staff    16M Jun  7 16:07 sample.tgz
c4651a13e4f93a8bf36b094614fbe97cd484341b  57593bc91d236d0500b4393d.tgz
c8ade21035760ea622c25a1cc9bdabb6d6cfb14c  sample.tgz
```

#### With aws-cli 1.10.36

```
(s3)❯ aws --version && ./test.sh
aws-cli/1.10.36 Python/2.7.10 Darwin/15.6.0 botocore/1.4.26
download: s3://data/sample.tgz to ./sample.s3.tgz
download: s3://data/57593bc91d236d0500b4393d.tgz to ./57593bc91d236d0500b4393d.s3.tgz
## Hashed files:
-rw-r--r--  1 aaron  staff    17M Jun  9 12:06 57593bc91d236d0500b4393d.curl.tgz
-rw-r--r--  1 aaron  staff    25M Jun  9 12:00 57593bc91d236d0500b4393d.s3.tgz
-rw-r--r--  1 aaron  staff    16M Jun  9 12:06 sample.curl.tgz
-rw-r--r--  1 aaron  staff    16M Jun  7 16:07 sample.s3.tgz
c4651a13e4f93a8bf36b094614fbe97cd484341b  57593bc91d236d0500b4393d.curl.tgz
89c65ea9bb38f74adbc29007e2f7ee901702eba3  57593bc91d236d0500b4393d.s3.tgz
c8ade21035760ea622c25a1cc9bdabb6d6cfb14c  sample.curl.tgz
c8ade21035760ea622c25a1cc9bdabb6d6cfb14c  sample.s3.tgz

## Original:
-rw-r--r--  1 aaron  staff    17M Jun  9 12:00 57593bc91d236d0500b4393d.tgz
-rw-r--r--  1 aaron  staff    16M Jun  7 16:07 sample.tgz
c4651a13e4f93a8bf36b094614fbe97cd484341b  57593bc91d236d0500b4393d.tgz
c8ade21035760ea622c25a1cc9bdabb6d6cfb14c  sample.tgz
```

#### With aws-cli 1.10.6 (used in new GitBook builder)

```
(s3)❯ aws --version && ./test.sh
aws-cli/1.10.6 Python/2.7.10 Darwin/15.6.0 botocore/1.3.28
download: s3://data/sample.tgz to ./sample.s3.tgz
download: s3://data/57593bc91d236d0500b4393d.tgz to ./57593bc91d236d0500b4393d.s3.tgz
## Hashed files:
-rw-r--r--  1 aaron  staff    17M Jun  9 12:05 57593bc91d236d0500b4393d.curl.tgz
-rw-r--r--  1 aaron  staff    25M Jun  9 12:00 57593bc91d236d0500b4393d.s3.tgz
-rw-r--r--  1 aaron  staff    16M Jun  9 12:05 sample.curl.tgz
-rw-r--r--  1 aaron  staff    16M Jun  7 16:07 sample.s3.tgz
c4651a13e4f93a8bf36b094614fbe97cd484341b  57593bc91d236d0500b4393d.curl.tgz
19b504ba17c79c32d9bc20043e8f8e45c49f5ea8  57593bc91d236d0500b4393d.s3.tgz
c8ade21035760ea622c25a1cc9bdabb6d6cfb14c  sample.curl.tgz
c8ade21035760ea622c25a1cc9bdabb6d6cfb14c  sample.s3.tgz

## Original:
-rw-r--r--  1 aaron  staff    17M Jun  9 12:00 57593bc91d236d0500b4393d.tgz
-rw-r--r--  1 aaron  staff    16M Jun  7 16:07 sample.tgz
c4651a13e4f93a8bf36b094614fbe97cd484341b  57593bc91d236d0500b4393d.tgz
c8ade21035760ea622c25a1cc9bdabb6d6cfb14c  sample.tgz
```
