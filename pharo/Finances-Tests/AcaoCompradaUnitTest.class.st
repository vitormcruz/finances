Class {
	#name : #AcaoCompradaUnitTest,
	#superclass : #AcaoAbstractUnitTest,
	#category : #'Finances-Tests'
}

{ #category : #'test support' }
AcaoCompradaUnitTest >> operacaoGeradoraClass [

	^ OperacaoCompra
]

{ #category : #'test support' }
AcaoCompradaUnitTest >> operacaoNaoGeradoraClass [

	^ OperacaoVenda.
]

{ #category : #running }
AcaoCompradaUnitTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."

	acao := AcaoComprada newParaTicker: 'TESTE'.
	
]

{ #category : #'as yet unclassified' }
AcaoCompradaUnitTest >> testa_calculaNovoMontanteOperacao_venda [
	| acaoComprada montanteCalculado |
	
	acaoComprada := AcaoComprada newParaTicker: 'TESTE'.
	acaoComprada comprar: 100 em: DateAndTime now totalizando: 1000.
	montanteCalculado := acaoComprada calculaNovoMontanteOperacaoNaoGeradora: (OperacaoVenda comLoteDe: 100
																														paraAcao: acaoComprada
																														em: DateAndTime now
																														totalizando: 2000).
	self assert: montanteCalculado equals: 0
]

{ #category : #tests }
AcaoCompradaUnitTest >> testa_isComprada [

	self assert: (AcaoComprada newParaTicker: 'TESTE') isComprada.
]

{ #category : #tests }
AcaoCompradaUnitTest >> testa_isVendida [

	self deny: (AcaoComprada newParaTicker: 'TESTE') isVendida.
]
