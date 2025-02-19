"
A JSON web signature
"
Class {
	#name : #JsonWebSignature,
	#superclass : #Object,
	#instVars : [
		'payload',
		'protectedHeader',
		'publicKey',
		'privateKey'
	],
	#category : #'JSONWebToken-Core-Base'
}

{ #category : #materializing }
JsonWebSignature class >> materializeCompact: aString key: aKeyString [
	^ self materializeCompact: aString key: aKeyString checkSignature: true
		
]

{ #category : #materializing }
JsonWebSignature class >> materializeCompact: aString key: aKeyString checkSignature: checkSignature [
	^ JWSCompactSerializer new materialize: aString key: aKeyString checkSignature: checkSignature
		
]

{ #category : #comparing }
JsonWebSignature >> = aWebSignature [
	^ (aWebSignature hasSameProtectedHeader: protectedHeader) and: [ 
		aWebSignature hasSamePayload: payload ] 
]

{ #category : #accessing }
JsonWebSignature >> algorithm [
	^ self protectedHeader algorithm
]

{ #category : #accessing }
JsonWebSignature >> algorithm: anAlgorithm [
	self protectedHeader algorithm: anAlgorithm
]

{ #category : #accessing }
JsonWebSignature >> algorithmName: aString [
	self algorithm: (JsonWebAlgorithm named: aString)
]

{ #category : #private }
JsonWebSignature >> base64UrlDecoded: aBase64String [

	^ JWSSerializer base64UrlDecoded: aBase64String
]

{ #category : #signature }
JsonWebSignature >> checkSignature: aString [
	| token |
	token := (aString isString not) 
		ifTrue: [ 
			"this seems to be the old usage handing out the parts collection so resemble"
			'.' join: aString  ]
		ifFalse: [ aString ].
	
	self protectedHeader algorithm checkSignature: token withKey: publicKey

]

{ #category : #serialization }
JsonWebSignature >> compactSerialized [
	^ JWSCompactSerializer new serialize: self 
]

{ #category : #testing }
JsonWebSignature >> hasSameHeader: aJsonWebSignature [ 
	self shouldBeImplemented.
]

{ #category : #testing }
JsonWebSignature >> hasSamePayload: aPayload [
	aPayload ifNil: [ ^ false ].
	^ aPayload hasSameElements: payload
]

{ #category : #testing }
JsonWebSignature >> hasSameProtectedHeader: aHeader [
	^ protectedHeader = aHeader
	
]

{ #category : #comparing }
JsonWebSignature >> hash [
	^ protectedHeader hash bitXor: payload hash
]

{ #category : #accessing }
JsonWebSignature >> header [
	^ protectedHeader ifNil: [ 
		protectedHeader := self headerClass new ]
]

{ #category : #accessing }
JsonWebSignature >> headerClass [
	^ JWSHeader
]

{ #category : #accessing }
JsonWebSignature >> payload [
	^ payload
]

{ #category : #accessing }
JsonWebSignature >> payload: anObject [
	payload := anObject.

]

{ #category : #accessing }
JsonWebSignature >> privateKey [

	^ privateKey
]

{ #category : #accessing }
JsonWebSignature >> privateKey: aKey [

	privateKey := aKey
]

{ #category : #accessing }
JsonWebSignature >> protectedHeader [
	^ protectedHeader ifNil: [ 
		protectedHeader := self headerClass new ]
]

{ #category : #accessing }
JsonWebSignature >> publicKey [

	^ publicKey
]

{ #category : #accessing }
JsonWebSignature >> publicKey: aKey [

	publicKey := aKey
]

{ #category : #accessing }
JsonWebSignature >> setProtectedHeader: aHeader [ 
	protectedHeader := aHeader
]

{ #category : #signing }
JsonWebSignature >> signatureFor: aString [

	^ self protectedHeader algorithm signMessage: aString withKey: privateKey
]

{ #category : #configuring }
JsonWebSignature >> symmetricKey: aKey [

	self
		publicKey: aKey;
		privateKey: aKey
]

{ #category : #writing }
JsonWebSignature >> writePayloadOn: aSerializer [ 
	aSerializer writePayload: payload
]

{ #category : #writing }
JsonWebSignature >> writeProtectedHeaderOn: aSerializer [ 
	aSerializer writeHeader: protectedHeader
]
