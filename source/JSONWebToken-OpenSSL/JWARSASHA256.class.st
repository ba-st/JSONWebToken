"
RSA SHA256 
"
Class {
	#name : #JWARSASHA256,
	#superclass : #JsonWebAlgorithm,
	#category : #'JSONWebToken-OpenSSL'
}

{ #category : #sign }
JWARSASHA256 class >> checkSignature: signature withKey: key isValidFor: headerAndPayload [

	| signatureAsBytes publicKey |

	signatureAsBytes := JWSSerializer base64UrlDecoded: signature.
	publicKey := ( key includesSubstring: 'BEGIN RSA PUBLIC KEY' )
		             ifTrue: [ LcEvpPublicKey setRSA: ( LcRSA fromRsaPublicKeyPemString: key ) ]
		             ifFalse: [ LcEvpPublicKey fromPublicKeyPemString: key ].
	headerAndPayload pinInMemory.
	signatureAsBytes pinInMemory.
	[
	( publicKey digestVerifyMessage: headerAndPayload with: signatureAsBytes ) ifFalse: [
		Error signal: 'signature does not match' ]
	] ensure: [
		headerAndPayload unpinInMemory.
		signatureAsBytes unpinInMemory
		]
]

{ #category : #accessing }
JWARSASHA256 class >> parameterValue [
	^ 'RS256'
]

{ #category : #sign }
JWARSASHA256 class >> signMessage: message withKey: anObject [
	| pkey sig |
	pkey := LcEvpPublicKey setRSA: (LcRSA fromPemString: anObject).
	message pinInMemory.
	sig := [ pkey digestSignMessage: message ]
		ensure: [ message unpinInMemory ].
	^ sig
]
