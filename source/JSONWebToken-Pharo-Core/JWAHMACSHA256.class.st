"
HMAC SHA256 
"
Class {
	#name : 'JWAHMACSHA256',
	#superclass : 'JsonWebAlgorithm',
	#category : 'JSONWebToken-Pharo-Core',
	#package : 'JSONWebToken-Pharo-Core'
}

{ #category : 'sign' }
JWAHMACSHA256 class >> checkSignature: signature withKey: key isValidFor: headerAndPayload [

	( self signMessage: headerAndPayload withKey: key ) = ( JWSSerializer base64UrlDecoded: signature )
		ifFalse: [ CryptoError signal: 'signature does not match' ]
]

{ #category : 'accessing' }
JWAHMACSHA256 class >> parameterValue [
	^ 'HS256'
]

{ #category : 'sign' }
JWAHMACSHA256 class >> signMessage: aString withKey: key [
	^ ((HMAC on: SHA256) 
		key: key asByteArray; 
		digestMessage: aString asByteArray)
]
