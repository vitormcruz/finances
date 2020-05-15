Class {
	#name : #PosicaoComprada,
	#superclass : #Posicao,
	#category : #'Finances-Core'
}

{ #category : #'instance creation' }
PosicaoComprada class >> newParaTiker: aString [ 

	^ super new ticker: aString.

]

{ #category : #atualizacao }
PosicaoComprada >> aplica: aLancamento [ 

	^ ativoFinanceiro comprar: aLancamento quantidade 
			 			   em: aLancamento data 
						   totalizando: aLancamento valor.
]

{ #category : #accessors }
PosicaoComprada >> tipoPosicao [

	^ #Comprada.
]

{ #category : #'resultado financeiro' }
PosicaoComprada >> totalInvestido [

	^ ativoFinanceiro montanteTotal.
]
