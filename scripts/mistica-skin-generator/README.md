# Mistica skin generator

This utility is designed to generate code using Node.js. It offers two main commands for its use:
`npm run test` to run the tests and `npm run generate` to execute the code generation tool.

## Requirements

- Node.js
- npm

## Installation

To use this utility, execute:

```bash
npm install
```

## Token generation

Execute:

```bash
npm run generate
```

It will get the tokens from `mistica-design` repository and generate the Swift code inside the `mistica-ios`
project.

## Testing tool

Execute:

```bash
npm run test
```

or

```bash
npm run test:watch
```

It will check if the tool works properly executing its tests. Useful to contribute here.

## Troubleshooting

### I want to add a new brand

To add a new brand, just add a new element to [`BRANDS`](index.js).

### I want to get tokens from a different mistica-design branch

To get them, just change the [`BRANCH` value](index.js).
