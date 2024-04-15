# JSON Web Token

A fork of JSON Web Token to be used as a dependency in [ba-st](https://githu.com/ba-st) for GS/64 & Pharo.

The `upstream` branch is supposed to track the changes in the `master` branch of [noha/JSONWebToken](https://github.com/noha/JSONWebToken)

The `release-candidate` is the branch where our changes land before releasing a version.

[![Pharo - Unit Tests](https://github.com/ba-st-dependencies/JSONWebToken/actions/workflows/unit-tests.yml/badge.svg)](https://github.com/ba-st-dependencies/JSONWebToken/actions/workflows/unit-tests.yml/badge.svg)
[![GS64 - Unit Tests](https://github.com/ba-st-dependencies/JSONWebToken/actions/workflows/unit-tests-gs64.yml/badge.svg)](https://github.com/ba-st-dependencies/JSONWebToken/actions/workflows/unit-tests-gs64.yml)
[![Coverage Status](https://codecov.io/github/ba-st-dependencies/JSONWebToken/coverage.svg?branch=release-candidate)](https://codecov.io/gh/ba-st-dependencies/JSONWebToken/branch/release-candidate)

[![Baseline Groups](https://github.com/ba-st-dependencies/JSONWebToken/actions/workflows/loading-groups.yml/badge.svg)](https://github.com/ba-st-dependencies/JSONWebToken/actions/workflows/loading-groups.yml)
[![GS64 Components](https://github.com/ba-st-dependencies/JSONWebToken/actions/workflows/loading-gs64-components.yml/badge.svg)](https://github.com/ba-st-dependencies/JSONWebToken/actions/workflows/loading-gs64-components.yml)
[![Markdown Lint](https://github.com/ba-st-dependencies/JSONWebToken/actions/workflows/markdown-lint.yml/badge.svg)](https://github.com/ba-st-dependencies/JSONWebToken/actions/workflows/markdown-lint.yml)

[![GitHub release](https://img.shields.io/github/release/ba-st-dependencies/JSONWebToken.svg)](https://github.com/ba-st-dependencies/JSONWebToken/releases/latest)
[![Pharo 9.0](https://img.shields.io/badge/Pharo-9.0-informational)](https://pharo.org)
[![Pharo 10](https://img.shields.io/badge/Pharo-10-informational)](https://pharo.org)
[![Pharo 11](https://img.shields.io/badge/Pharo-11-informational)](https://pharo.org)

[![GS64 3.7.0](https://img.shields.io/badge/GS64-3.7.0-informational)](https://gemtalksystems.com/products/gs64/)
[![GS64 3.7.1](https://img.shields.io/badge/GS64-3.7.1-informational)](https://gemtalksystems.com/products/gs64/)

## Overview

Implementation of a JSON web token following [RFC 7519](https://tools.ietf.org/html/rfc7519)
for [Pharo](http://www.pharo.org) and [GemStone 64](https://gemtalksystems.com/products/gs64/)

## Usage

The class `JSONWebTokenTest` demonstrates how to encode/serialize a web
signature to a token string using compact base 64 notation as well as
deserialization:

```smalltalk
testRoundtrip
  | jws tokenString materialized |
  
  jws := JsonWebSignature new
    algorithmName: 'HS256';
    payload: (JWTClaimsSet new
      at: 'bar' put: 'foo').
  jws symmetricKey: 'foobar'.
  
  tokenString := jws compactSerialized.
  materialized := JsonWebSignature materializeCompact: tokenString key: 'foobar'.
  self assert: jws equals: materialized

```

## Further Info

- [JWT, JWS and JWE for Not So Dummies!](https://medium.facilelogin.com/jwt-jws-and-jwe-for-not-so-dummies-b63310d201a3)
