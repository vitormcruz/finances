Class {
	#name : #AcaoVendidaUnitTest,
	#superclass : #TestCase,
	#category : #'Finances-Core-Tests'
}

{ #category : #tests }
AcaoVendidaUnitTest >> testa_agregar_operacao_de_venda [

	| acao |
	
	acao := AcaoVendida newParaTicker: 'TESTE'.

	acao << (Venda comLoteDe: 100 em: DateAndTime now totalizando: 2000).
	acao << (Venda comLoteDe: 200 em: DateAndTime now totalizando: 2000).
	acao << (Venda comLoteDe: 300 em: DateAndTime now totalizando: 2000).
		
	self assert: acao totalAcoes 
		  equals: 600.
		
	self assert: acao montanteTotal 
		  equals: -6000.
]

{ #category : #tests }
AcaoVendidaUnitTest >> testa_agregar_opercao_de_compra_completa_em_acao_vendida [

	| acao |
	
	acao := AcaoVendida newParaTicker: 'TESTE'.

	acao << (Venda comLoteDe: 100 em: DateAndTime now totalizando: 2000).
	acao << (Compra comLoteDe: 100 em: DateAndTime now totalizando: 2000).

	self assert: acao montanteTotal equals: 0.
	self assert: acao totalAcoes equals: 0.
]

{ #category : #'as yet unclassified' }
AcaoVendidaUnitTest >> testa_agregar_opercao_de_venda_parcial_em_acao_vendida [

	| acao |
	
	acao := AcaoVendida newParaTicker: 'TESTE'.

	acao << (Venda comLoteDe: 100 em: DateAndTime now totalizando: 2000).
	acao << (Compra comLoteDe: 50 em: DateAndTime now totalizando: 2000).

	self assert: acao montanteTotal equals: -1000.
	self assert: acao totalAcoes equals: 50.
]

{ #category : #tests }
AcaoVendidaUnitTest >> testa_inicializa_operacao_venda_com_resultado [
	| operacaoVenda acao |
	
	acao := Acao newParaTicker: 'TESTE'.
	acao comprar: 100 em: DateAndTime now totalizando: 1000.
	operacaoVenda := acao vender: 100 em: DateAndTime now totalizando: 3000.
	self assert: operacaoVenda resultado equals: 2000
]

{ #category : #tests }
AcaoVendidaUnitTest >> testa_inicializa_operacao_venda_sem_resultado [
	| operacaoVenda |
	operacaoVenda := Venda
		comLoteDe: 100
		em: DateAndTime today
		totalizando: 1000.
	self assert: operacaoVenda resultado equals: nil
]
