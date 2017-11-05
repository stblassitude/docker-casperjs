# stblassitude/casperjs

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

This Docker image contains [CasperJS](http://casperjs.org), a web testing tool, ready to run from the command line.

It lives on GitHub at [github.com/stblassitude/docker-casperjs](https://github.com/stblassitude/docker-casperjs), and on Docker Hub at [hub.docker.com/r/stblassitude/casperjs/](https://hub.docker.com/r/stblassitude/casperjs/).

## Tags

* `:1.0.0` (also `:latest`) contains PhantomJS 2.1.1 and CasperJS 1.1.4

## Using this image

The entrypoint for this image is `/usr/bin/casper`, so you can invoke Casper scripts like so:

```bash
docker run --rm -it -v $PWD:/app stblassitude/casperjs hello.js
```

This will run `hello.js` from the current directory with Casper, and display output in the terminal.

The volume `/app` should be bind mounted to your current working directory, or whereever you keep your Casper scripts.

### Running PhantomJS

This image also contains [PhantomJS](http://phantomjs.org). You can invoke PhantomJS directly by overriding the entrypoint, like so:

```bash
docker run --rm -it -v $PWD:/app --entrypoint=/usr/bin/phantomjs stblassitude/casperjs --help
```

## Building

I'm building this image this way:

```bash
docker build -t stblassitude/casperjs .
```
