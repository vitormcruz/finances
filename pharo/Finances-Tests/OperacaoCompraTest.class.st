Class {
	#name : #OperacaoCompraTest,
	#superclass : #TestCase,
	#category : #'Finances-Tests'
}

{ #category : #'as yet unclassified' }
OperacaoCompraTest >> test_seCompra [

	self assert: (OperacaoCompra new seCompra: [ true ]).
]

{ #category : #'as yet unclassified' }
OperacaoCompraTest >> test_seVenda [

	self assert: (OperacaoCompra new seVenda: [ true ])
		  equals: nil.
]

{ #category : #tests }
OperacaoCompraTest >> testa_inicializa_operacao_compra_com_resultado [
	| operacaoCompra acao |
	
	acao := Acao newParaTicker: 'TESTE'.
	acao vender: 100 em: DateAndTime today totalizando: 2000.
	
	operacaoCompra := OperacaoCompra comLoteDe: 100
	 										  paraAcao: acao
										     em: DateAndTime today
											  totalizando: 1000.
											
	self assert: operacaoCompra resultado equals: 1000
]

{ #category : #tests }
OperacaoCompraTest >> testa_inicializa_operacao_compra_sem_resultado [
	| operacaoVenda |
	
	operacaoVenda := OperacaoVenda comLoteDe: 100
											paraAcao: (Acao newParaTicker: 'TESTE')
											em: DateAndTime today
											totalizando: 1000.
											
	self assert: operacaoVenda resultado equals: nil.
]
