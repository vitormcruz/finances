Class {
	#name : #PosicaoVendida,
	#superclass : #Posicao,
	#category : #'Finances-Core'
}

{ #category : #'operacao - calcular' }
PosicaoVendida >> << umaOperacao [ 

	umaOperacao seCompra: [ ^ self realizaPosicao: umaOperacao ].
	self incrementaPosicao: umaOperacao.
	

]

{ #category : #'operacao - calcular' }
PosicaoVendida >> incrementaPosicao: umaOperacao [ 

	totalAcoes := totalAcoes + umaOperacao lote.
	montanteTotal := montanteTotal - umaOperacao total.
]

{ #category : #'operacao - calcular' }
PosicaoVendida >> realizaValor: valorRealizado [

	montanteTotal := montanteTotal + valorRealizado.

	
]

{ #category : #accessors }
PosicaoVendida >> tipoPosicao [
	
	^ #Vendida
]

{ #category : #'resultado financeiro' }
PosicaoVendida >> totalInvestido [

	^ ativoFinanceiro montanteTotal.
]
