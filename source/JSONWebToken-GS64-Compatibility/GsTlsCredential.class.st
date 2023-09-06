"
In GS64, GsTlsCredential is a class that encapsulates TLS private keys, public keys,
and X509 certificates. Instances contain a hidden reference to C pointer
to the OpenSSL representation of the TLS object.

This version is just a placeholder so we can easily create extensions methods to load in GS64 specific
packages.
"
Class {
	#name : #GsTlsCredential,
	#superclass : #Object,
	#category : #'JSONWebToken-GS64-Compatibility'
}
