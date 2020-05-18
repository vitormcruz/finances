Class {
	#name : #PosicaoCompradaUnitTest,
	#superclass : #TestCase,
	#category : #'Finances-Core-Tests'
}

{ #category : #'as yet unclassified' }
PosicaoCompradaUnitTest >> testa_aplica_novo_lancamento [

	| posicao |

	posicao := PosicaoComprada newParaTicker: 'BOVA11'.
	
	(Lancamento newFor: #('BOVA11' '01/04/2020' '100' '1000')) meAplicaEm: posicao.
		
	self assertCollection: posicao operacoes asOperacaoStrings 
		  equals: #('1 April 2020,100,1000,,10') asOrderedCollection 
	

]

{ #category : #'as yet unclassified' }
PosicaoCompradaUnitTest >> testa_aplica_varios_lancamentos [

	| posicao |

	posicao := PosicaoComprada newParaTicker:  'BOVA11'.
	
	(Lancamento newFor: #('BOVA11' '01/04/2020' '100' '1000')) meAplicaEm: posicao.
	(Lancamento newFor: #('BOVA11' '10/05/2020' '200' '1000')) meAplicaEm: posicao.
	(Lancamento newFor: #('BOVA11' '25/06/2020' '300' '2400')) meAplicaEm: posicao.
		
	self assertCollection: posicao operacoes asOperacaoStrings 
		  equals: #('1 April 2020,100,1000,,10'
				      '10 May 2020,200,1000,,5'
						'25 June 2020,300,2400,,8') asOrderedCollection 
	

]

{ #category : #'tests - creation' }
PosicaoCompradaUnitTest >> testa_cria_posicao_comprada_de_acao [
	| posicao |
	
	posicao := PosicaoComprada newParaTicker: 'BOVA11'.
	self assert: posicao tipoAtivo equals: #Acao.
	self assert: posicao tipoPosicao equals: #Comprada.
]

{ #category : #'as yet unclassified' }
PosicaoCompradaUnitTest >> testa_total_investido_com_lancamentos_processados [

	| posicao |

	posicao := PosicaoComprada newParaTicker: 'BOVA11'.
	
	(Lancamento newFor: #('BOVA11' '01/04/2020' '100' '1000')) meAplicaEm: posicao.
	(Lancamento newFor: #('BOVA11' '10/05/2020' '200' '1000')) meAplicaEm: posicao.
	(Lancamento newFor: #('BOVA11' '25/06/2020' '300' '2000')) meAplicaEm: posicao.
		
	self assert: posicao totalInvestido
		  equals: 4000
	

]

{ #category : #'as yet unclassified' }
PosicaoCompradaUnitTest >> testa_total_investido_sem_lancamentos_processados [

	| posicao |

	posicao := PosicaoComprada newParaTicker: 'BOVA11'.
	self assert: posicao totalInvestido
		  equals: 0
	

]
