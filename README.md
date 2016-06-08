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

