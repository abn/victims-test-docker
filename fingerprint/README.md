## Produce checksums across JDK versions

### Building
```sh
docker build -t="victims/fingerprint-test" fingerprint
```

### Run Test
```sh
docker run -it --rm victims/fingerprint-test victims-fingerprint-test $GIT_REPO
```

### Run Victims Java Client command
```sh
docker run -it --rm victims/fingerprint-test victims-java-client $ARGS
```
