# Healthy

### A golang binary implementation of a web server returning 200/ok to a port provided via an environment variable
The container is superlight - 5MB
It's build from scratch and running a single binary compiled with go

# Usage
`docker run -p 1234:1234 -e PORT=1234 omerxx/healthy`
Then `curl 127.0.0.1:1234` would return 200/ok

## If no $PORT is set, the env defaults to 8000:
`docker run -p 8000:8000 omerxx/healthy`
