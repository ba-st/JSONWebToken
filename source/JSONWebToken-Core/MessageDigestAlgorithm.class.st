Class {
	#name : #MessageDigestAlgorithm,
	#superclass : #Object,
	#classVars : [
		'Algorithms'
	],
	#category : #'JSONWebToken-Core'
}

{ #category : #'class initialization' }
MessageDigestAlgorithm class >> initialize [

	Algorithms := Dictionary new
]

{ #category : #accessing }
MessageDigestAlgorithm class >> sha1 [

	^ (Algorithms at: self sha1ShortName) value
]

{ #category : #accessing }
MessageDigestAlgorithm class >> sha1ShortName [

	^ 'SHA-1'
]

{ #category : #configuring }
MessageDigestAlgorithm class >> use: aMessageDigestAlgorithmFactory for: shortName [

	Algorithms at: shortName put: aMessageDigestAlgorithmFactory
]

{ #category : #accessing }
MessageDigestAlgorithm >> blockSizeInBits [

	^ self subclassResponsibility
]

{ #category : #digesting }
MessageDigestAlgorithm >> digest: bytes [
	"Returns a ByteArray with the computed digest"

	^ self subclassResponsibility
]

{ #category : #digesting }
MessageDigestAlgorithm >> digestAsHexString: bytes [
	"Returns a string with the hexadecimal representation of the computed digest"

	^ self subclassResponsibility
]

{ #category : #digesting }
MessageDigestAlgorithm >> digestString: string [

	^ self subclassResponsibility
]

{ #category : #digesting }
MessageDigestAlgorithm >> digestStringAsHexString: string [

	^ self subclassResponsibility 
]

{ #category : #accessing }
MessageDigestAlgorithm >> messageDigestSizeInBits [

	^ self subclassResponsibility
]

{ #category : #default }
MessageDigestAlgorithm >> shortName [

	^ self subclassResponsibility
]

{ #category : #accessing }
MessageDigestAlgorithm >> wordSizeInBits [

	^ self subclassResponsibility
]
