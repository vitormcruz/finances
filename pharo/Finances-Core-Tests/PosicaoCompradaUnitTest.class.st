Class {
	#name : #PosicaoCompradaUnitTest,
	#superclass : #TestCase,
	#category : #'Finances-Core-Tests'
}

{ #category : #'tests - compra' }
PosicaoCompradaUnitTest >> testa_agregar_operacao_de_compra [

	| posicao |
	
	posicao := PosicaoComprada newParaTicker: 'TESTE'.

	posicao << (Compra comLoteDe: 100 em: DateAndTime now totalizando: 2000).
	posicao << (Compra comLoteDe: 200 em: DateAndTime now totalizando: 2000).
	posicao << (Compra comLoteDe: 300 em: DateAndTime now totalizando: 2000).
		
	self assert: posicao totalAcoes 
		  equals: 600.
		
	self assert: posicao montanteTotal 
		  equals: 6000.
]

{ #category : #'tests - compra' }
PosicaoCompradaUnitTest >> testa_agregar_opercao_de_venda_completa_em_acao_comprada [

	| posicao |
	
	posicao := PosicaoComprada newParaTicker: 'TESTE'.

	posicao << (Compra comLoteDe: 100 em: DateAndTime now totalizando: 2000).
	posicao << (Venda comLoteDe: 100 em: DateAndTime now totalizando: 2000).

	self assert: posicao montanteTotal equals: 0.
	self assert: posicao totalAcoes equals: 0.
]

{ #category : #'tests - compra' }
PosicaoCompradaUnitTest >> testa_agregar_opercao_de_venda_parcial_em_acao_comprada [

	| posicao |
	
	posicao := PosicaoComprada newParaTicker: 'TESTE'.

	posicao << (Compra comLoteDe: 100 em: DateAndTime now totalizando: 2000).
	posicao << (Venda comLoteDe: 50 em: DateAndTime now totalizando: 2000).

	self assert: posicao montanteTotal equals: 1000.
	self assert: posicao totalAcoes equals: 50.
]

{ #category : #'tests - aplica lancamento' }
PosicaoCompradaUnitTest >> testa_aplica_novo_lancamento [

	| posicao |

	posicao := PosicaoComprada newParaTicker: 'BOVA11'.
	
	(Lancamento newFor: #('BOVA11' '01/04/2020' '100' '1000')) aplicarEm: posicao.
		
	self assertCollection: posicao operacoes asOperacaoStrings 
		  equals: #('1 April 2020,100,1000,,10') asOrderedCollection 
	

]

{ #category : #'tests - aplica lancamento' }
PosicaoCompradaUnitTest >> testa_aplica_varios_lancamentos [

	| posicao |

	posicao := PosicaoComprada newParaTicker:  'BOVA11'.
	
	(Lancamento newFor: #('BOVA11' '01/04/2020' '100' '1000')) aplicarEm: posicao.
	(Lancamento newFor: #('BOVA11' '10/05/2020' '200' '1000')) aplicarEm: posicao.
	(Lancamento newFor: #('BOVA11' '25/06/2020' '300' '2400')) aplicarEm: posicao.
		
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

{ #category : #'tests - compra' }
PosicaoCompradaUnitTest >> testa_inicializa_operacao_compra_com_resultado [
	| operacaoCompra posicao |
	
	posicao := PosicaoVendida newParaTicker: 'TESTE'.
	posicao vender: 100 em: DateAndTime now totalizando: 3000.
	
	operacaoCompra := posicao comprar: 100 em: DateAndTime now totalizando: 1000.
	self assert: operacaoCompra resultado equals: 2000
]

{ #category : #'tests - compra' }
PosicaoCompradaUnitTest >> testa_inicializa_operacao_compra_sem_resultado [
	| operacaoVenda |
	
	operacaoVenda := Venda comLoteDe: 100 em: DateAndTime today totalizando: 1000.
	self assert: operacaoVenda resultado equals: nil
]

{ #category : #'tests- total investido' }
PosicaoCompradaUnitTest >> testa_total_investido_com_lancamentos_processados [

	| posicao |

	posicao := PosicaoComprada newParaTicker: 'BOVA11'.
	
	(Lancamento newFor: #('BOVA11' '01/04/2020' '100' '1000')) aplicarEm: posicao.
	(Lancamento newFor: #('BOVA11' '10/05/2020' '200' '1000')) aplicarEm: posicao.
	(Lancamento newFor: #('BOVA11' '25/06/2020' '300' '2000')) aplicarEm: posicao.
		
	self assert: posicao montanteTotal 
		  equals: 4000
	

]

{ #category : #'tests- total investido' }
PosicaoCompradaUnitTest >> testa_total_investido_sem_lancamentos_processados [

	| posicao |

	posicao := PosicaoComprada newParaTicker: 'BOVA11'.
	self assert: posicao montanteTotal
		  equals: 0
	

]
