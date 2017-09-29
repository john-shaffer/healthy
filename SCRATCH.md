# How to build a go container FROM scratch?

## First, let's build our binary, either locally or in a golang container:
`docker run -v ~/go/src/httpserver:/usr/bin -it golang:1.8-alpine /bin/sh`
Then, inside `/usr/bin`, let's build: `GO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o main`

## What did we do?

Go binary is looking for libraries on the operating system it’s running on. We compiled our app, but it still is dynamically linked to the libraries it needs to run (i.e., all the C libraries it binds to). Unfortunately, scratch is empty, so there are no libraries and no loadpath for it to look in. What we have to do is modify our build script to statically compile our app with all libraries built in:
`CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o main .`

## What's scratch?
Scratch is a special docker image that’s empty. It’s truly 0B
Since we're using a compiled binary, that stores it's dependencies we need 0 os wrapping
