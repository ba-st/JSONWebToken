"
Abstract superclass for algorithms used for web encryption
"
Class {
	#name : #JsonWebAlgorithm,
	#superclass : #Object,
	#category : #'JSONWebToken-Core-Algorithms'
}

{ #category : #sign }
JsonWebAlgorithm class >> checkSignature: token withKey: publicKey [
	"keep this method backward compatible also accepting already splitted parts"

	| tokenParts |

	tokenParts := token isString
		              ifTrue: [ $. split: token ]
		              ifFalse: [ token ].

	self checkSignature: tokenParts third withKey: publicKey isValidFor: ( '.' join: {
				  tokenParts first.
				  tokenParts second } )
]

{ #category : #sign }
JsonWebAlgorithm class >> checkSignature: signature withKey: key isValidFor: headerAndPayload [

	self subclassResponsibility
]

{ #category : #testing }
JsonWebAlgorithm class >> isAbstract [

	^self name = #JsonWebAlgorithm 
]

{ #category : #'instance creation' }
JsonWebAlgorithm class >> named: aString [ 
	^ self allSubclasses 
		detect: [ :each | each parameterValue = aString ]
]

{ #category : #accessing }
JsonWebAlgorithm class >> parameterValue [
	self shouldBeImplemented 
]

{ #category : #sign }
JsonWebAlgorithm class >> signMessage: aString withKey: key [

	self subclassResponsibility
]
