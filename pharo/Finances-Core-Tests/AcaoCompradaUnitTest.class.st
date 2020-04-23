Class {
	#name : #AcaoCompradaUnitTest,
	#superclass : #TestCase,
	#category : #'Finances-Core-Tests'
}

{ #category : #tests }
AcaoCompradaUnitTest >> testa_agregar_operacao_de_compra [

	| acao |
	
	acao := AcaoComprada newParaTicker: 'TESTE'.

	acao << (Compra comLoteDe: 100 em: DateAndTime now totalizando: 2000).
	acao << (Compra comLoteDe: 200 em: DateAndTime now totalizando: 2000).
	acao << (Compra comLoteDe: 300 em: DateAndTime now totalizando: 2000).
		
	self assert: acao totalAcoes 
		  equals: 600.
		
	self assert: acao montanteTotal 
		  equals: 6000.
]

{ #category : #tests }
AcaoCompradaUnitTest >> testa_agregar_opercao_de_venda_completa_em_acao_comprada [

	| acao |
	
	acao := AcaoComprada newParaTicker: 'TESTE'.

	acao << (Compra comLoteDe: 100 em: DateAndTime now totalizando: 2000).
	acao << (Venda comLoteDe: 100 em: DateAndTime now totalizando: 2000).

	self assert: acao montanteTotal equals: 0.
	self assert: acao totalAcoes equals: 0.
]

{ #category : #tests }
AcaoCompradaUnitTest >> testa_agregar_opercao_de_venda_parcial_em_acao_comprada [

	| acao |
	
	acao := AcaoComprada newParaTicker: 'TESTE'.

	acao << (Compra comLoteDe: 100 em: DateAndTime now totalizando: 2000).
	acao << (Venda comLoteDe: 50 em: DateAndTime now totalizando: 2000).

	self assert: acao montanteTotal equals: 1000.
	self assert: acao totalAcoes equals: 50.
]

{ #category : #tests }
AcaoCompradaUnitTest >> testa_inicializa_operacao_compra_com_resultado [
	| operacaoCompra acao |
	
	acao := Acao newParaTicker: 'TESTE'.
	acao vender: 100 em: DateAndTime now totalizando: 3000.
	
	operacaoCompra := acao comprar: 100 em: DateAndTime now totalizando: 1000.
	self assert: operacaoCompra resultado equals: 2000
]

{ #category : #tests }
AcaoCompradaUnitTest >> testa_inicializa_operacao_compra_sem_resultado [
	| operacaoVenda |
	
	operacaoVenda := Venda comLoteDe: 100 em: DateAndTime today totalizando: 1000.
	self assert: operacaoVenda resultado equals: nil
]
