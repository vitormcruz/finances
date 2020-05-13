Class {
	#name : #Posicao,
	#superclass : #Object,
	#instVars : [
		'ativoFinanceiro',
		'operacoes'
	],
	#category : #'Finances-Core'
}

{ #category : #'instance creation' }
Posicao class >> newCompradaTicker: aString [ 

	^ PosicaoComprada newParaTiker: aString.
]

{ #category : #accessors }
Posicao >> ativoFinanceiro [

	^ ativoFinanceiro
]

{ #category : #initialization }
Posicao >> initialize [ 

	operacoes := OrderedCollection new.
]

{ #category : #acessors }
Posicao >> operacoes [

	^ operacoes clone.
]

{ #category : #accessors }
Posicao >> ticker: aString [ 

	ativoFinanceiro := aString asAtivoFinanceiroComprado.		
]

{ #category : #accessors }
Posicao >> tipoAtivo [

	^ ativoFinanceiro tipo.
]

{ #category : #accessors }
Posicao >> tipoPosicao [
	self subclassResponsibility.
]
