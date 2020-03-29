Class {
	#name : #OperacaoVenda,
	#superclass : #Operacao,
	#category : #Finances
}

{ #category : #'instance initialization' }
OperacaoVenda >> lote: loteOperacao acao: umaAcao data: aDate total: montanteInteger [

	super lote: loteOperacao 
			acao: umaAcao 
			data: aDate 
			total: montanteInteger.
			
	acao seComprada: [ resultado := montanteInteger - (umaAcao custoMeuLoteDe: loteOperacao) ].

]

{ #category : #calculations }
OperacaoVenda >> seVenda: aBlockClosure [ 

	^ aBlockClosure value.
]
