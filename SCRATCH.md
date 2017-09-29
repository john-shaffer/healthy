# How to build a go container FROM scratch?

Scratch is a special docker image that’s empty. It’s truly 0B
Go binary is looking for libraries on the operating system it’s running in. We compiled our app, but it still is dynamically linked to the libraries it needs to run (i.e., all the C libraries it binds to). Unfortunately, scratch is empty, so there are no libraries and no loadpath for it to look in. What we have to do is modify our build script to statically compile our app with all libraries built in:
`CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o main .`
