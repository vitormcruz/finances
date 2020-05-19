"
A PosicaoVendidaTest is a test class for testing the behavior of PosicaoVendida
"
Class {
	#name : #PosicaoVendidaTest,
	#superclass : #TestCase,
	#category : #'Finances-Core-Tests'
}

{ #category : #'tests - venda' }
PosicaoVendidaTest >> testa_agregar_operacao_de_venda [

	| posicao |
	
	posicao := PosicaoVendida newParaTicker: 'TESTE'.

	posicao << (Venda comLoteDe: 100 em: DateAndTime now totalizando: 2000).
	posicao << (Venda comLoteDe: 200 em: DateAndTime now totalizando: 2000).
	posicao << (Venda comLoteDe: 300 em: DateAndTime now totalizando: 2000).
		
	self assert: posicao totalAcoes 
		  equals: 600.
		
	self assert: posicao montanteTotal 
		  equals: -6000.
]

{ #category : #'tests - venda' }
PosicaoVendidaTest >> testa_agregar_opercao_de_compra_completa_em_acao_vendida [

	| posicao |
	
	posicao := PosicaoVendida newParaTicker: 'TESTE'.

	posicao << (Venda comLoteDe: 100 em: DateAndTime now totalizando: 2000).
	posicao << (Compra comLoteDe: 100 em: DateAndTime now totalizando: 2000).

	self assert: posicao montanteTotal equals: 0.
	self assert: posicao totalAcoes equals: 0.
]

{ #category : #'tests - venda' }
PosicaoVendidaTest >> testa_agregar_opercao_de_venda_parcial_em_acao_vendida [

	| posicao |
	
	posicao := PosicaoVendida newParaTicker: 'TESTE'.

	posicao << (Venda comLoteDe: 100 em: DateAndTime now totalizando: 2000).
	posicao << (Compra comLoteDe: 50 em: DateAndTime now totalizando: 2000).

	self assert: posicao montanteTotal equals: -1000.
	self assert: posicao totalAcoes equals: 50.
]

{ #category : #'tests - venda' }
PosicaoVendidaTest >> testa_inicializa_operacao_venda_com_resultado [
	| operacaoVenda posicao |
	
	posicao := PosicaoComprada newParaTicker: 'TESTE'.
	posicao comprar: 100 em: DateAndTime now totalizando: 1000.
	operacaoVenda := posicao vender: 100 em: DateAndTime now totalizando: 3000.
	self assert: operacaoVenda resultado equals: 2000
]

{ #category : #'tests - venda' }
PosicaoVendidaTest >> testa_inicializa_operacao_venda_sem_resultado [
	| operacaoVenda |
	
	operacaoVenda := Venda comLoteDe: 100 em: DateAndTime today totalizando: 1000.
	self assert: operacaoVenda resultado equals: nil
]
