Class {
	#name : #AcaoVendidaUnitTest,
	#superclass : #AcaoAbstractUnitTest,
	#category : #'Finances-Tests'
}

{ #category : #'test support' }
AcaoVendidaUnitTest >> operacaoGeradoraClass [

	^ OperacaoVenda.
]

{ #category : #'test support' }
AcaoVendidaUnitTest >> operacaoNaoGeradoraClass [

	^ OperacaoCompra.
]

{ #category : #running }
AcaoVendidaUnitTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."
	
	acao := AcaoVendida newParaTicker: 'TESTE'.
]

{ #category : #'as yet unclassified' }
AcaoVendidaUnitTest >> testa_calculaNovoMontanteOperacao_compra [
	| acaoVendida montanteCalculado |
	
	acaoVendida := AcaoVendida newParaTicker: 'TESTE'.
	acaoVendida vender: 100 em: DateAndTime now totalizando: 1000.
	montanteCalculado := acaoVendida calculaNovoMontanteOperacaoNaoGeradora: (OperacaoCompra comLoteDe: 50
																														paraAcao: acaoVendida
																														em: DateAndTime now
																														totalizando: 2000).
	self assert: montanteCalculado equals: 500
]

{ #category : #tests }
AcaoVendidaUnitTest >> testa_isComprada [

	self deny: (AcaoVendida newParaTicker: 'TESTE') isComprada.
]

{ #category : #tests }
AcaoVendidaUnitTest >> testa_isVendida [

	self assert: (AcaoVendida newParaTicker: 'TESTE') isVendida.
]
