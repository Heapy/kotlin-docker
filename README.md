# kotlin-docker [![Build Status](https://travis-ci.com/Heapy/kotlin-docker.svg?branch=master)](https://travis-ci.com/Heapy/kotlin-docker)

Docker container with JDK 11 and Kotlin for running Kotlin scripts.

## Usage

Define alias for running container:

```bash
alias ksc='docker run --rm -it -v $PWD:/context heapy/kotlin-docker';
```

### Run REPL

```bash
ksc
```

### Run script
```kotlin
// script.main.kts
@file:DependsOn("org.slf4j:slf4j-simple:1.7.30")

import org.slf4j.LoggerFactory

LoggerFactory.getLogger("MYSCRIPT").info("Test logging")
```

```bash
ksc script.main.kts
// [main] INFO MYSCRIPT - Test logging
```

## Release process

Create new tag with kotlin version and push it. Travis will build container and push it to registry.
