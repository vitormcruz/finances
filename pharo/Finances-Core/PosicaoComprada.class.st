Class {
	#name : #PosicaoComprada,
	#superclass : #Posicao,
	#category : #'Finances-Core'
}

{ #category : #'instance creation' }
PosicaoComprada class >> newParaTiker: aString [ 

	^ super new ticker: aString.

]

{ #category : #accessors }
PosicaoComprada >> tipoPosicao [

	^ #Comprada.
]
