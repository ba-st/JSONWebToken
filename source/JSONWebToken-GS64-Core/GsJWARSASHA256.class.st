"
RSA SHA256
"
Class {
	#name : #GsJWARSASHA256,
	#superclass : #JsonWebAlgorithm,
	#category : #'JSONWebToken-GS64-Core'
}

{ #category : #sign }
GsJWARSASHA256 class >> checkSignature: signature withKey: publicKey isValidFor: headerAndPayload [

	^ [
	  headerAndPayload
		  verifyWithSha256AndRsaPublicKey: ( GsTlsPublicKey newFromPemString: publicKey )
		  signature: signature
	  ]
		  on: ArgumentError
		  do: [ :error | error return: false ]
]

{ #category : #accessing }
GsJWARSASHA256 class >> parameterValue [

	^ 'RS256'
]

{ #category : #sign }
GsJWARSASHA256 class >> signMessage: aString withKey: privateKey [

	^ aString
		  signWithSha256AndRsaPssPrivateKey: ( GsTlsPrivateKey newFromPemString: privateKey )
		  into: nil
]
