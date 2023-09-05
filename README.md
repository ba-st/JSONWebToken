# JSONWebToken

[![Pharo - Unit Tests](https://github.com/ba-st-dependencies/JSONWebToken/actions/workflows/unit-tests.yml/badge.svg)](https://github.com/ba-st-dependencies/JSONWebToken/actions/workflows/unit-tests.yml/badge.svg)
[![Coverage Status](https://codecov.io/github/ba-st-dependencies/JSONWebToken/coverage.svg?branch=release-candidate)](https://codecov.io/gh/ba-st-dependencies/JSONWebToken/branch/release-candidate)

[![Pharo 9.0](https://img.shields.io/badge/Pharo-9.0-informational)](https://pharo.org)
[![Pharo 10](https://img.shields.io/badge/Pharo-10-informational)](https://pharo.org)
[![Pharo 11](https://img.shields.io/badge/Pharo-11-informational)](https://pharo.org)

## Overview

Implementation of a JSON web token following [RFC 7519](https://tools.ietf.org/html/rfc7519) for [Pharo](http://www.pharo.org) and GemStone 64

## Usage

The class `JSONWebTokenTest` demonstrates how to encode/serialize a web signature to a token string using compact base 64 notation 
as well as deserialization:

```smalltalk
testRoundtrip
	| jws tokenString materialized |
	
	jws := JsonWebSignature new
		algorithmName: 'HS256';
		payload: (JWTClaimsSet new
			at: 'bar' put: 'foo').
	jws key: 'foobar'.
	
	tokenString := jws compactSerialized.
	materialized := JsonWebSignature materializeCompact: tokenString key: 'foobar'.
	self assert: jws equals: materialized

```

## Further Info
- [JWT, JWS and JWE for Not So Dummies!](https://medium.facilelogin.com/jwt-jws-and-jwe-for-not-so-dummies-b63310d201a3)
