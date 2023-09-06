Extension { #name : #String }

{ #category : #'*JSONWebToken-Pharo-Core' }
String >> asPrivateKey [

	^ LcEvpPublicKey setRSA: ( LcRSA fromPemString: self )
]

{ #category : #'*JSONWebToken-Pharo-Core' }
String >> asPublicKey [

	^ ( self includesSubstring: 'BEGIN RSA PUBLIC KEY' )
		  ifTrue: [ LcEvpPublicKey setRSA: ( LcRSA fromRsaPublicKeyPemString: self ) ]
		  ifFalse: [ LcEvpPublicKey fromPublicKeyPemString: self ]
]

{ #category : #'*JSONWebToken-Pharo-Core' }
String >> base64Padded [
	| paddedString |
	paddedString := ((self size \\ 4) = 0) 
		ifTrue: [ self ]
		ifFalse: [ 
			String streamContents: [ :stream | 
				stream nextPutAll: self. 
				(4 - (self size \\ 4)) timesRepeat: [ 
					stream nextPut: $= ] ] ].
	^ paddedString 
]
