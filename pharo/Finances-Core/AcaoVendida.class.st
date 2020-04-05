Class {
	#name : #AcaoVendida,
	#superclass : #Acao,
	#category : #'Finances-Core-Finances-Core'
}

{ #category : #'operacao - calcular' }
AcaoVendida >> << umaOperacao [ 

	umaOperacao seCompra: [ ^ self realizaPosicao: umaOperacao ].
	self incrementaPosicao: umaOperacao.
	

]

{ #category : #'operacao - calcular' }
AcaoVendida >> incrementaPosicao: umaOperacao [ 

	totalAcoes := totalAcoes + umaOperacao lote.
	montanteTotal := montanteTotal - umaOperacao total.
]

{ #category : #'operacao - calcular' }
AcaoVendida >> realizaValor: valorRealizado [

	montanteTotal := montanteTotal + valorRealizado.

	
]
