"
RSA SHA256 
"
Class {
	#name : #JWARSASHA256,
	#superclass : #JsonWebAlgorithm,
	#category : #'JSONWebToken-OpenSSL'
}

{ #category : #sign }
JWARSASHA256 class >> checkSignature: signature withKey: publicKeyOrString isValidFor: headerAndPayload [

	| signatureAsBytes publicKey |

	signatureAsBytes := JWSSerializer base64UrlDecoded: signature.
	publicKey := publicKeyOrString asPublicKey.
	headerAndPayload pinInMemory.
	signatureAsBytes pinInMemory.
	[
	( publicKey digestVerifyMessage: headerAndPayload with: signatureAsBytes ) ifFalse: [
		CryptoError signal: 'signature does not match' ]
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
JWARSASHA256 class >> signMessage: message withKey: privateKeyOrString [

	| privateKey |

	privateKey := privateKeyOrString asPrivateKey.
	message pinInMemory.
	^ [ privateKey digestSignMessage: message ] ensure: [ message unpinInMemory ]
]
