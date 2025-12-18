# Healthy

A service that always returns a healthy response.
Used for testing.

Forked from [omerxx/healthy](https://github.com/omerxx/healthy).

# Usage
`PORT=1234 nix run github:john-shaffer/healthy`

Then `curl 127.0.0.1:1234` would return 200/ok

Or just `nix run` if run from inside the repository.

If no $PORT is set, the env defaults to 8000:

`nix run github:john-shaffer/healthy`

# Docker image

```bash 
nix build github:john-shaffer/healthy#healthy-image
docker load -i ./result
```
