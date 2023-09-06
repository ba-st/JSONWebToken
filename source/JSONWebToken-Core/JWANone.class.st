"
An empty algorithm for not signing
"
Class {
	#name : #JWANone,
	#superclass : #JsonWebAlgorithm,
	#category : #'JSONWebToken-Core-Algorithms'
}

{ #category : #sign }
JWANone class >> checkSignature: signature withKey: key isValidFor: headerAndPayload [
	
]

{ #category : #accessing }
JWANone class >> parameterValue [
	^ 'none'
]

{ #category : #signing }
JWANone class >> signMessage: aString withKey: aKeyString [
	^ #[]
]
