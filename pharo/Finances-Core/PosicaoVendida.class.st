Class {
	#name : #PosicaoVendida,
	#superclass : #Posicao,
	#category : #'Finances-Core'
}

{ #category : #accessors }
PosicaoVendida >> ticker: aString [ 

	ativoFinanceiro := aString asAtivoFinanceiroVendido.	
]

{ #category : #accessors }
PosicaoVendida >> tipoPosicao [
	
	^ #Vendida
]

{ #category : #'resultado financeiro' }
PosicaoVendida >> totalInvestido [

	^ ativoFinanceiro montanteTotal.
]
