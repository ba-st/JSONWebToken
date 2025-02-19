Class {
	#name : #JSONWebTokenOpenSSLTest,
	#superclass : #TestCase,
	#category : #'JSONWebToken-OpenSSL-Tests'
}

{ #category : #private }
JSONWebTokenOpenSSLTest >> privateKey [

	^ '-----BEGIN RSA PRIVATE KEY-----
MIIEogIBAAKCAQEAnzyis1ZjfNB0bBgKFMSvvkTtwlvBsaJq7S5wA+kzeVOVpVWw
kWdVha4s38XM/pa/yr47av7+z3VTmvDRyAHcaT92whREFpLv9cj5lTeJSibyr/Mr
m/YtjCZVWgaOYIhwrXwKLqPr/11inWsAkfIytvHWTxZYEcXLgAXFuUuaS3uF9gEi
NQwzGTU1v0FqkqTBr4B8nW3HCN47XUu0t8Y0e+lf4s4OxQawWD79J9/5d3Ry0vbV
3Am1FtGJiJvOwRsIfVChDpYStTcHTCMqtvWbV6L11BWkpzGXSW4Hv43qa+GSYOD2
QU68Mb59oSk2OB+BtOLpJofmbGEGgvmwyCI9MwIDAQABAoIBACiARq2wkltjtcjs
kFvZ7w1JAORHbEufEO1Eu27zOIlqbgyAcAl7q+/1bip4Z/x1IVES84/yTaM8p0go
amMhvgry/mS8vNi1BN2SAZEnb/7xSxbflb70bX9RHLJqKnp5GZe2jexw+wyXlwaM
+bclUCrh9e1ltH7IvUrRrQnFJfh+is1fRon9Co9Li0GwoN0x0byrrngU8Ak3Y6D9
D8GjQA4Elm94ST3izJv8iCOLSDBmzsPsXfcCUZfmTfZ5DbUDMbMxRnSo3nQeoKGC
0Lj9FkWcfmLcpGlSXTO+Ww1L7EGq+PT3NtRae1FZPwjddQ1/4V905kyQFLamAA5Y
lSpE2wkCgYEAy1OPLQcZt4NQnQzPz2SBJqQN2P5u3vXl+zNVKP8w4eBv0vWuJJF+
hkGNnSxXQrTkvDOIUddSKOzHHgSg4nY6K02ecyT0PPm/UZvtRpWrnBjcEVtHEJNp
bU9pLD5iZ0J9sbzPU/LxPmuAP2Bs8JmTn6aFRspFrP7W0s1Nmk2jsm0CgYEAyH0X
+jpoqxj4efZfkUrg5GbSEhf+dZglf0tTOA5bVg8IYwtmNk/pniLG/zI7c+GlTc9B
BwfMr59EzBq/eFMI7+LgXaVUsM/sS4Ry+yeK6SJx/otIMWtDfqxsLD8CPMCRvecC
2Pip4uSgrl0MOebl9XKp57GoaUWRWRHqwV4Y6h8CgYAZhI4mh4qZtnhKjY4TKDjx
QYufXSdLAi9v3FxmvchDwOgn4L+PRVdMwDNms2bsL0m5uPn104EzM6w1vzz1zwKz
5pTpPI0OjgWN13Tq8+PKvm/4Ga2MjgOgPWQkslulO/oMcXbPwWC3hcRdr9tcQtn9
Imf9n2spL/6EDFId+Hp/7QKBgAqlWdiXsWckdE1Fn91/NGHsc8syKvjjk1onDcw0
NvVi5vcba9oGdElJX3e9mxqUKMrw7msJJv1MX8LWyMQC5L6YNYHDfbPF1q5L4i8j
8mRex97UVokJQRRA452V2vCO6S5ETgpnad36de3MUxHgCOX3qL382Qx9/THVmbma
3YfRAoGAUxL/Eu5yvMK8SAt/dJK6FedngcM3JEFNplmtLYVLWhkIlNRGDwkg3I5K
y18Ae9n7dHVueyslrb6weq7dTkYDi3iOYRW8HRkIQh06wEdbxt0shTzAJvvCQfrB
jg/3747WSsf/zBTcHihTRBdAv6OmdhV4/dD5YBfLAkLrd+mX7iE=
-----END RSA PRIVATE KEY-----'
]

{ #category : #private }
JSONWebTokenOpenSSLTest >> publicKey [

	^ '-----BEGIN PUBLIC KEY-----
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAnzyis1ZjfNB0bBgKFMSv
vkTtwlvBsaJq7S5wA+kzeVOVpVWwkWdVha4s38XM/pa/yr47av7+z3VTmvDRyAHc
aT92whREFpLv9cj5lTeJSibyr/Mrm/YtjCZVWgaOYIhwrXwKLqPr/11inWsAkfIy
tvHWTxZYEcXLgAXFuUuaS3uF9gEiNQwzGTU1v0FqkqTBr4B8nW3HCN47XUu0t8Y0
e+lf4s4OxQawWD79J9/5d3Ry0vbV3Am1FtGJiJvOwRsIfVChDpYStTcHTCMqtvWb
V6L11BWkpzGXSW4Hv43qa+GSYOD2QU68Mb59oSk2OB+BtOLpJofmbGEGgvmwyCI9
MwIDAQAB
-----END PUBLIC KEY-----'
]

{ #category : #tests }
JSONWebTokenOpenSSLTest >> testFailingSignatureChecking [

	| jws tokenString |

	jws := JsonWebSignature new
		       algorithmName: 'RS256';
		       payload: ( JWTClaimsSet new at: 'bar' put: 'foo' ).
	jws
		privateKey: self privateKey;
		publicKey: self publicKey.

	tokenString := jws compactSerialized.

	self
		should: [ JsonWebSignature materializeCompact: tokenString , 'X' key: self publicKey ]
		raise: CryptoError
]

{ #category : #tests }
JSONWebTokenOpenSSLTest >> testRSAEncoding [
	"This test verifies the token serialization against https://jwt.io/"

	| jws tokenString |

	jws := JsonWebSignature new
		       algorithmName: 'RS256';
		       payload: ( JWTClaimsSet new
				         at: 'scope'
				         put:
					         'read:operations read:metrics execute:health-check read:application-info execute:application-control read:application-configuration';
				         yourself ).
	jws privateKey: self privateKey.

	tokenString := jws compactSerialized.

	self
		assert: tokenString
		equals:
		'eyJhbGciOiJSUzI1NiJ9.eyJzY29wZSI6InJlYWQ6b3BlcmF0aW9ucyByZWFkOm1ldHJpY3MgZXhlY3V0ZTpoZWFsdGgtY2hlY2sgcmVhZDphcHBsaWNhdGlvbi1pbmZvIGV4ZWN1dGU6YXBwbGljYXRpb24tY29udHJvbCByZWFkOmFwcGxpY2F0aW9uLWNvbmZpZ3VyYXRpb24ifQ.GAOd8yN4b1R85hF4BrI7SUtdrQClMrymg7BaZoSIPezc9j-qBvIzJNcZT0a_hE44v8XUhHQJaaMzCgEoIWvN_i31RhL-NT_d85m2jm1HAd1hdePveS5shgYGVa0YUloRqLUsaTK03spCe3AayHBxG0-IJdw5ZZ85grce1JFc-T3uxGE_meuSBSYoW8QWEQ7hyBkHrJX0Twu1W0VMRGQw1UDnur2xxVZnz66iAYEQVZUQmsbMqgwOPETNvlvfmTQJq4V_hbc9bNmzJwo8TeoH5_lUYkPp5wWtT3H7dZpNEROP8QGgHiO9Y8ByKOBSrlNOID0pBvNlRbOAz_2Vmiir-g'
]

{ #category : #tests }
JSONWebTokenOpenSSLTest >> testRoundtrip [

	| jws tokenString materialized |

	jws := JsonWebSignature new
		       algorithmName: 'RS256';
		       payload: ( JWTClaimsSet new at: 'bar' put: 'foo' ).
	jws
		privateKey: self privateKey;
		publicKey: self publicKey.

	tokenString := jws compactSerialized.

	materialized := JsonWebSignature materializeCompact: tokenString key: self publicKey.

	self assert: jws equals: materialized
]
