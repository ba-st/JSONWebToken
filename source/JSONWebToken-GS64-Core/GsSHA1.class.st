Class {
	#name : #GsSHA1,
	#superclass : #MessageDigestAlgorithm,
	#category : #'JSONWebToken-GS64-Core'
}

{ #category : #'class initialization' }
GsSHA1 class >> initialize [

	| instance |
	instance := self new.
	MessageDigestAlgorithm use: [ instance ] for: self shortName
]

{ #category : #accessing }
GsSHA1 class >> shortName [

	^ self sha1ShortName
]

{ #category : #accessing }
GsSHA1 >> blockSizeInBits [

	^ 512
]

{ #category : #digesting }
GsSHA1 >> digest: bytes [

	^ bytes sha1SumBytes
]

{ #category : #digesting }
GsSHA1 >> digestAsHexString: bytes [

	^ bytes asSha1String
]

{ #category : #digesting }
GsSHA1 >> digestString: string [

	^ string sha1SumBytes
]

{ #category : #digesting }
GsSHA1 >> digestStringAsHexString: string [

	^ string asSha1String
]

{ #category : #accessing }
GsSHA1 >> messageDigestSizeInBits [

	^ 160
]

{ #category : #default }
GsSHA1 >> shortName [

	^ self class shortName
]

{ #category : #accessing }
GsSHA1 >> wordSizeInBits [

	^ 32
]
