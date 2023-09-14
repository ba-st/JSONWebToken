Extension { #name : #SHA1 }

{ #category : #'*JSONWebToken-Pharo-Core' }
SHA1 >> blockSizeInBits [

	^ self class blockSize * 8
]

{ #category : #'*JSONWebToken-Pharo-Core' }
SHA1 >> digest: bytes [

	^ self hashMessage: bytes
]

{ #category : #'*JSONWebToken-Pharo-Core' }
SHA1 >> digestAsHexString: bytes [

	^ (self digest: bytes) hex
]

{ #category : #'*JSONWebToken-Pharo-Core' }
SHA1 >> digestString: string [

	^ self digest: string utf8Encoded
]

{ #category : #'*JSONWebToken-Pharo-Core' }
SHA1 >> digestStringAsHexString: string [

	^ self digestAsHexString: string utf8Encoded
]

{ #category : #'*JSONWebToken-Pharo-Core' }
SHA1 >> messageDigestSizeInBits [

	^ self class hashSize * 8
]

{ #category : #'*JSONWebToken-Pharo-Core' }
SHA1 >> wordSizeInBits [

	^ 32
]
