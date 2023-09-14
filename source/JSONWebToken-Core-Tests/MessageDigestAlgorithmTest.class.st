"
A MessageDigestAlgorithmTest is a test class for testing the behavior of MessageDigestAlgorithm
"
Class {
	#name : #MessageDigestAlgorithmTest,
	#superclass : #TestCase,
	#category : #'JSONWebToken-Core-Tests'
}

{ #category : #tests }
MessageDigestAlgorithmTest >> testSHA1Accessing [

	self
		assert: MessageDigestAlgorithm sha1 blockSizeInBits equals: 512;
		assert: MessageDigestAlgorithm sha1 wordSizeInBits equals: 32;
		assert: MessageDigestAlgorithm sha1 messageDigestSizeInBits
		equals: 160
]

{ #category : #tests }
MessageDigestAlgorithmTest >> testSHA1Digest [

	| message |
	message := 'The quick brown fox jumps over the lazy dog'.

	self
		assert: (MessageDigestAlgorithm sha1 digest: message utf8Encoded)
		equals:
			#[ 47 212 225 198 122 45 40 252 237 132 158 225 187 118 231 57 27
			   147 235 18 ];
		assert:
			(MessageDigestAlgorithm sha1 digestAsHexString: message utf8Encoded)
		equals: '2fd4e1c67a2d28fced849ee1bb76e7391b93eb12'.

	self
		assert: (MessageDigestAlgorithm sha1 digestString: message)
		equals:
			#[ 47 212 225 198 122 45 40 252 237 132 158 225 187 118 231 57 27
			   147 235 18 ];
		assert:
			(MessageDigestAlgorithm sha1 digestStringAsHexString: message)
		equals: '2fd4e1c67a2d28fced849ee1bb76e7391b93eb12'
]
