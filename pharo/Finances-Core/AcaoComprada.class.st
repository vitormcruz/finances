Class {
	#name : #AcaoComprada,
	#superclass : #Acao,
	#category : #'Finances-Core'
}

{ #category : #'operacao - calcular' }
AcaoComprada >> << umaOperacao [ 

	umaOperacao seCompra: [ ^ self incrementaPosicao: umaOperacao ].
	self realizaPosicao: umaOperacao.


]

{ #category : #'operacao - calcular' }
AcaoComprada >> incrementaPosicao: umaOperacao [  

	totalAcoes := totalAcoes + umaOperacao lote.
	montanteTotal := montanteTotal + umaOperacao total.
]

{ #category : #'operacao - calcular' }
AcaoComprada >> realizaValor: valorRealizado [

	montanteTotal := montanteTotal - valorRealizado.

	
]
