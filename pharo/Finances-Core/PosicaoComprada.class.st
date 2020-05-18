Class {
	#name : #PosicaoComprada,
	#superclass : #Posicao,
	#category : #'Finances-Core'
}

{ #category : #accessors }
PosicaoComprada >> ticker: aString [ 

	ativoFinanceiro := aString asAtivoFinanceiroComprado.			
]

{ #category : #accessors }
PosicaoComprada >> tipoPosicao [

	^ #Comprada.
]

{ #category : #'resultado financeiro' }
PosicaoComprada >> totalInvestido [

	^ ativoFinanceiro montanteTotal.
]
