Extension { #name : 'String' }

{ #category : '*JSONWebToken-Pharo-OpenSSL' }
String >> asPrivateKey [

	^ LcEvpPublicKey setRSA: ( LcRSA fromPemString: self )
]

{ #category : '*JSONWebToken-Pharo-OpenSSL' }
String >> asPublicKey [

	^ ( self includesSubstring: 'BEGIN RSA PUBLIC KEY' )
		  ifTrue: [ LcEvpPublicKey setRSA: ( LcRSA fromRsaPublicKeyPemString: self ) ]
		  ifFalse: [ LcEvpPublicKey fromPublicKeyPemString: self ]
]
