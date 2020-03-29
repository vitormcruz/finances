Class {
	#name : #OperacaoVendaTest,
	#superclass : #TestCase,
	#category : #'Finances-Tests'
}

{ #category : #tests }
OperacaoVendaTest >> test_seCompra [

	self assert: (OperacaoVenda new seCompra: [ true ])
		  equals: nil.
]

{ #category : #tests }
OperacaoVendaTest >> test_seVenda [

	self assert: (OperacaoVenda new seVenda: [ true ]).
]

{ #category : #tests }
OperacaoVendaTest >> testa_inicializa_operacao_venda_com_resultado [
	| operacaoVenda acao |
	
	acao := Acao newParaTicker: 'TESTE'.
	acao comprar: 100 em: DateAndTime now totalizando: 1000.
	
	operacaoVenda := OperacaoVenda comLoteDe: 100
											paraAcao: acao
										   em: DateAndTime now
											totalizando: 3000.
											
	self assert: operacaoVenda resultado equals: 2000
]

{ #category : #tests }
OperacaoVendaTest >> testa_inicializa_operacao_venda_sem_resultado [
	| operacaoVenda |
	
	operacaoVenda := OperacaoVenda comLoteDe: 100
											paraAcao: (Acao newParaTicker: 'TESTE')
											em: DateAndTime today
											totalizando: 1000.
											
	self assert: operacaoVenda resultado equals: nil.
]
