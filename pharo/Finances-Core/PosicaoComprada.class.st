Class {
	#name : #PosicaoComprada,
	#superclass : #Posicao,
	#category : #'Finances-Core'
}

{ #category : #'operacao - calcular' }
PosicaoComprada >> << umaOperacao [ 

	umaOperacao seCompra: [ ^ self incrementaPosicao: umaOperacao ].
	self realizaPosicao: umaOperacao.


]

{ #category : #'operacao - calcular' }
PosicaoComprada >> incrementaPosicao: umaOperacao [  

	totalAcoes := totalAcoes + umaOperacao lote.
	montanteTotal := montanteTotal + umaOperacao total.
]

{ #category : #'operacao - calcular' }
PosicaoComprada >> realizaValor: valorRealizado [

	montanteTotal := montanteTotal - valorRealizado.

	
]

{ #category : #accessors }
PosicaoComprada >> tipoPosicao [

	^ #Comprada.
]

{ #category : #'resultado financeiro' }
PosicaoComprada >> totalInvestido [

	^ montanteTotal.
]
