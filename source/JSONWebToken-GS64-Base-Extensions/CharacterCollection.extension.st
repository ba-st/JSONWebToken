Extension { #name : #CharacterCollection }

{ #category : #'*JSONWebToken-GS64-Base-Extensions' }
CharacterCollection >> base64Padded [
	| paddedString |
	paddedString := ((self size \\ 4) = 0) 
		ifTrue: [ self ]
		ifFalse: [ 
			self class streamContents: [ :stream | 
				stream nextPutAll: self. 
				(4 - (self size \\ 4)) timesRepeat: [ 
					stream nextPut: $= ] ] ].
	^ paddedString 
]
