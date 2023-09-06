"
RSA SHA256
"
Class {
	#name : #GsJWARSASHA256,
	#superclass : #JsonWebAlgorithm,
	#category : #'JSONWebToken-GS64-Core'
}

{ #category : #sign }
GsJWARSASHA256 class >> checkSignature: signature withKey: publicKeyOrString isValidFor: headerAndPayload [

	^ headerAndPayload
		  verifyWithSha256AndRsaPublicKey: publicKeyOrString asPublicKey
		  signature: ( JWSSerializer base64UrlDecoded: signature )
]

{ #category : #accessing }
GsJWARSASHA256 class >> parameterValue [

	^ 'RS256'
]

{ #category : #sign }
GsJWARSASHA256 class >> signMessage: aString withKey: privateKeyOrString [

	^ aString signWithSha256AndRsaPrivateKey: privateKeyOrString asPrivateKey into: nil
]
