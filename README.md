
# Mura-Shunter-Skeleton-Boilerplate

A basic [Mura CMS](https://github.com/blueriver/MuraCMS) theme example using [Shunter](https://github.com/springernature/Shunter).


## Requirements

- [Mura CMS](https://github.com/blueriver/MuraCMS) 6.2 or later
- [Node.js](https://nodejs.org/en/) 0.12+ (we recommend using [node version manager](https://github.com/creationix/nvm))


## Installation

- Clone this repo
- Run `npm install` in the root of your working copy
- Copy the routes config with `cp config/routes.sample.json config/routes.json`


## Running

Start the shunter-boilerplate application with:

```sh
npm start
```

Start the sample back-end in a different terminal window with:

```sh
npm run json-serve
```

Open up [http://localhost:5400/](http://localhost:5400/).

If you'd like to run both of these processes together, you can use [Foreman](https://github.com/ddollar/foreman) to do so:

```sh
foreman start
```


## Development

When working on shunter-boilerplate you should follow this guide to ensure that everything's consistent and the tests pass.

### Linting and Testing

We run linters and tests on every pull-request and change to the `master` branch. You should run the same linters and tests locally before you commit your work in order to save yourself time. Use the following commands:

```sh
make lint  # Run the linters
make test  # Run the tests
make ci    # Run everything that runs on CI
```
