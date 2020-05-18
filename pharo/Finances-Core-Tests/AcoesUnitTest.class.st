"
An AcoesTest is a test class for testing the behavior of Acoes
"
Class {
	#name : #AcoesUnitTest,
	#superclass : #TestCase,
	#instVars : [
		'acoesFake'
	],
	#category : #'Finances-Core-Tests'
}

{ #category : #running }
AcoesUnitTest >> setUp [

	acoesFake := AcoesFake new.

]

{ #category : #'as yet unclassified' }
AcoesUnitTest >> testa_obter_acao_para_tiker_ja_obtido [
	
	| bova11 |

	bova11 := acoesFake acaoDoTicker: 'BOVA11'.

	self assert: (acoesFake acaoDoTicker: 'BOVA11') operacoes isEmpty.
]

{ #category : #'as yet unclassified' }
AcoesUnitTest >> testa_obter_acao_para_tiker_nunca_obtido [

	self assert: (acoesFake acaoDoTicker: 'BOVA11') operacoes isEmpty.
]
