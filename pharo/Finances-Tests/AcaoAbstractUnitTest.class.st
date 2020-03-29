Class {
	#name : #AcaoAbstractUnitTest,
	#superclass : #TestCase,
	#instVars : [
		'acao'
	],
	#category : #'Finances-Tests'
}

{ #category : #testing }
AcaoAbstractUnitTest class >> isAbstract [
	
	^ self = AcaoAbstractUnitTest. 
]

{ #category : #'test support' }
AcaoAbstractUnitTest >> operacaoGeradoraClass [

	self subclassResponsibility.
]

{ #category : #'test support' }
AcaoAbstractUnitTest >> operacaoNaoGeradoraClass [

	self subclassResponsibility.
]

{ #category : #tests }
AcaoAbstractUnitTest >> testa_calcula_montante_nova_operacao_geradora_tipo_acao [

	| montanteCalculado |
	
	montanteCalculado := acao calculaNovoMontanteParaOperacao: (self operacaoGeradoraClass comLoteDe: 100 
																				  		 							 paraAcao: acao 
																						                       em: DateAndTime now 
																						                       totalizando: 1000).
																						
	self assert: montanteCalculado equals: 1000


]

{ #category : #tests }
AcaoAbstractUnitTest >> testa_isOperacaoGeradora_false [

	self deny: (acao isTipoOperacaoGeradora: self operacaoNaoGeradoraClass new).
	
]

{ #category : #tests }
AcaoAbstractUnitTest >> testa_isOperacaoGeradora_true [

	self assert: (acao isTipoOperacaoGeradora: self operacaoGeradoraClass new).
	
]
