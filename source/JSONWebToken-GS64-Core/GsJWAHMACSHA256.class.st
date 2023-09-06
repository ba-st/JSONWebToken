"
HMAC SHA256
"
Class {
	#name : #GsJWAHMACSHA256,
	#superclass : #JsonWebAlgorithm,
	#category : #'JSONWebToken-GS64-Core'
}

{ #category : #sign }
GsJWAHMACSHA256 class >> checkSignature: signature withKey: key isValidFor: headerAndPayload [

	( self signMessage: headerAndPayload withKey: key ) = ( JWSSerializer base64UrlDecoded: signature )
		ifFalse: [ CryptoError signal: 'signature does not match' ]
]

{ #category : #accessing }
GsJWAHMACSHA256 class >> parameterValue [
	^ 'HS256'
]

{ #category : #sign }
GsJWAHMACSHA256 class >> signMessage: aString withKey: key [

	^ ByteArray fromHexString: ( aString asSha256HmacStringWithKey: key )
]
