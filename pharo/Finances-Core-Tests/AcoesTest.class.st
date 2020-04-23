"
An AcoesTest is a test class for testing the behavior of Acoes
"
Class {
	#name : #AcoesTest,
	#superclass : #TestCase,
	#instVars : [
		'acoesFake'
	],
	#category : #'Finances-Core-Tests'
}

{ #category : #running }
AcoesTest >> setUp [

	acoesFake := AcoesFake new.

]

{ #category : #'as yet unclassified' }
AcoesTest >> testa_obter_acao_para_tiker_ja_obtido [
	
	| bova11 |

	bova11 := acoesFake acaoDoTicker: 'BOVA11'.

	self assert: (acoesFake acaoDoTicker: 'BOVA11') operacoes isEmpty.
]

{ #category : #'as yet unclassified' }
AcoesTest >> testa_obter_acao_para_tiker_nunca_obtido [

	self assert: (acoesFake acaoDoTicker: 'BOVA11') operacoes isEmpty.
]
