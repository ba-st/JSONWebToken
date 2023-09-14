Class {
	#name : #BaselineOfJSONWebToken,
	#superclass : #BaselineOf,
	#category : #BaselineOfJSONWebToken
}

{ #category : #baselines }
BaselineOfJSONWebToken >> baseline: spec [

	<baseline>
	spec for: #pharo do: [
		spec postLoadDoIt: #configureMessageDigestAlgorithms.
		spec baseline: 'NeoJSON' with: [ spec repository: 'github://svenvc/NeoJSON:master/repository' ].
		spec
			baseline: 'OpenSSL'
			with: [ spec repository: 'github://PierceNg/OpenSSL-Pharo:openssl_1_1_pharo9/src-st' ].
		spec
			package: 'JSONWebToken-Core' with: [ spec requires: #( 'NeoJSON' ) ];
			package: 'JSONWebToken-Pharo-Core' with: [ spec requires: #( 'JSONWebToken-Core' ) ];
			package: 'JSONWebToken-Core-Tests'
			with: [ spec requires: #( 'JSONWebToken-Core' 'JSONWebToken-Pharo-Core' ) ];
			package: 'JSONWebToken-OpenSSL' with: [ spec requires: #( 'Core' 'OpenSSL' ) ];
			package: 'JSONWebToken-OpenSSL-Tests' with: [ spec requires: #( 'JSONWebToken-OpenSSL' ) ].
		spec
			group: 'Core' with: #( 'JSONWebToken-Core' 'JSONWebToken-Pharo-Core' );
			group: 'SSL' with: #( 'JSONWebToken-OpenSSL' );
			group: 'Tests' with: #( 'JSONWebToken-Core-Tests' 'JSONWebToken-OpenSSL-Tests' );
			group: 'default' with: #( 'Core' 'SSL' 'Tests' )
		]
]

{ #category : #baselines }
BaselineOfJSONWebToken >> configureMessageDigestAlgorithms [

	Smalltalk globals
		at: #MessageDigestAlgorithm
		ifPresent: [ :class |
		class use: [ SHA1 new ] for: class sha1ShortName ]
]
