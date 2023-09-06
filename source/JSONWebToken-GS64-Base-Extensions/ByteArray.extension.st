Extension { #name : #ByteArray }

{ #category : #'*JSONWebToken-GS64-Base-Extensions' }
ByteArray >> base64Encoded [
	"Encode the receiver using Base64, returning a String.
	Base64 encoding is a technique to represent binary data as ASCII text.
	The inverse operation is String>>#base64Decoded"

	^ ZnBase64Encoder new encode: self
]
