Class {
	#name : #Posicao,
	#superclass : #Object,
	#instVars : [
		'ativoFinanceiro'
	],
	#category : #'Finances-Core'
}

{ #category : #'instance creation' }
Posicao class >> newParaTicker: aString [ 

	^ super new ticker: aString.
]

{ #category : #accessors }
Posicao >> ativoFinanceiro [

	^ ativoFinanceiro
]

{ #category : #acessors }
Posicao >> operacoes [

	^ ativoFinanceiro operacoes clone.
]

{ #category : #accessors }
Posicao >> ticker: aString [ 

	self subclassResponsibility.	
]

{ #category : #accessors }
Posicao >> tipoAtivo [

	^ ativoFinanceiro tipo.
]

{ #category : #accessors }
Posicao >> tipoPosicao [
	self subclassResponsibility.
]

{ #category : #'resultado financeiro' }
Posicao >> totalInvestido [

	self subclassResponsibility.
]
