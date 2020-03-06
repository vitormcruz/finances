Class {
	#name : #Conta,
	#superclass : #Object,
	#instVars : [
		'nome'
	],
	#category : #Finances
}

{ #category : #'instance creation' }
Conta class >> newNomeada: aString [ 
	
	^ super newValidating: [ super new nome: aString	].

]

{ #category : #accessors }
Conta >> nome: aString [ 

	aString ifNil: [ ^ self issueError: 'conta.nome.obrigatorio' ].
	nome := aString.
]
