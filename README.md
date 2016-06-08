# s3bugs

Bugs with amazons aws cli

## Testing

Run `server.sh` in one terminal then `test.sh`.

`test.sh` will download the file with `aws s3` and `curl`, compare their hashes to detect corruption.

## Corrupted data

The tricky thing is, data is not always corrupted. But we have a `tar.gz` file that does. You can see it at `data/sample.tgz`.

### Tests

Results of tests I ran:

#### With aws-cli 1.6.3

```
❯ ./test.sh             ⇣
download: s3://data/sample.tgz to ./s3.tgz
## Hashed files:
-rw-r--r--  1 aaron  staff    16M Jun  8 15:51 curl.tgz
-rw-r--r--  1 aaron  staff    23M Jun  7 16:07 s3.tgz
5ac6d976e94f661a742980be57431df2d0ad295d  s3.tgz
c8ade21035760ea622c25a1cc9bdabb6d6cfb14c  curl.tgz

## Original:
-rw-r--r--  1 aaron  staff    16M Jun  7 16:07 /Users/aaron/git/s3bugs/data/sample.tgz
c8ade21035760ea622c25a1cc9bdabb6d6cfb14c  /Users/aaron/git/s3bugs/data/sample.tgz
```
