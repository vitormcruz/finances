"
A PosicaoTest is a test class for testing the behavior of Posicao
"
Class {
	#name : #PosicaoTest,
	#superclass : #TestCase,
	#category : #'Finances-Core-Tests'
}

{ #category : #'tests - get operacao' }
PosicaoTest >> testa_obter_operacoes_por_ticker_possuidor_N_operacoes [
	| posicoes operacoes data posicao |
	
	posicoes := PosicoesInMemory new.
	data := Date today.
	
	posicao := posicoes posicao: #Comprada doTicker: 'BOVA11'.
	
	posicao comprar: 200 em: data totalizando: 1000.
	posicao comprar: 100 em: (data + 1) asDate totalizando: 23456.
	posicao comprar: 1000 em: (data + 2) asDate totalizando: 100000.
	
	operacoes := posicao operacoes collect: [ :op | 
		'{1} {2} {3}' format: {op lote. op data yyyymmdd. op total.}
	].
		
	self assert: operacoes asSet equals: {'200 ', data yyyymmdd  , ' 1000'.
												  		   '100 ', (data + 1) asDate yyyymmdd  , ' 23456'.
												  		   '1000 ', (data + 2) asDate yyyymmdd  , ' 100000'.} asSet .

]

{ #category : #'tests - get operacao' }
PosicaoTest >> testa_obter_operacoes_por_ticker_possuidor_uma_operacao [
	| posicoes operacoes data operacaoObtida posicao|
	
	posicoes := PosicoesInMemory new.
	data := Date today.
	
	posicao := posicoes posicao: #Comprada doTicker: 'IBOV3'.
	
	posicao comprar: 100 em: data totalizando: 1000.
	operacoes := posicao operacoes.
	self assert: operacoes size equals: 1.
	
	operacaoObtida := operacoes at: 1.
	self assert: operacaoObtida lote equals: 100.
	self assert: operacaoObtida data equals: data.
	self assert: operacaoObtida total equals: 1000.
]

{ #category : #'tests - ordem das operacoes' }
PosicaoTest >> testa_ordem_operacoes [

"Depois tem que ver como fazer isso quando existir operações positivas e negativas."

	self skip.
]

{ #category : #'tests - valor medio' }
PosicaoTest >> testa_valorMedio_com_N_operacoes_positivas_sem_nunca_zerar_posicao [

	| posicao |
	
	posicao := PosicoesInMemory new posicao: #Comprada doTicker: 'BOVA11'.
	posicao comprar: 100 em: Date today totalizando: 1000.
	posicao comprar: 100 em: Date today totalizando: 2000.
	posicao comprar: 100 em: Date today totalizando: 3000.
	self assert: posicao valorMedio equals: 20
	

]

{ #category : #'tests - valor medio' }
PosicaoTest >> testa_valorMedio_com_N_operacoes_zerarando_posicao [

	| posicao |
	
	posicao := PosicoesInMemory new posicao: #Comprada doTicker: 'BOVA11'.
	posicao comprar: 100 em: DateAndTime now totalizando: 1000.
	posicao comprar: 100 em: DateAndTime now totalizando: 1000.
	posicao comprar: 100 em: DateAndTime now totalizando: 1000.
	posicao vender: 300 em: DateAndTime now totalizando: 4000.
	self assert: posicao valorMedio equals: 0.	

]

{ #category : #'tests - valor medio' }
PosicaoTest >> testa_valorMedio_com_uma_operacao_compra [

	| posicao |
	
	posicao := PosicoesInMemory new posicao: #Comprada doTicker: 'BOVA11'.
	posicao comprar: 100 em: Date today totalizando: 1000.
	self assert: posicao valorMedio equals: 10
	

]

{ #category : #'tests - valor medio' }
PosicaoTest >> testa_valorMedio_com_uma_operacao_venda [

	| posicao |
	
	posicao := PosicoesInMemory new posicao: #Vendida doTicker: 'BOVA11'.
	posicao vender: 100 em: Date today totalizando: 1000.
	self assert: posicao valorMedio equals: 10
	

]

{ #category : #'tests - valor medio' }
PosicaoTest >> testa_valorMedio_sem_operacoes [

	| posicao |
	
	posicao := PosicoesInMemory new posicao: #Comprada doTicker: 'BOVA11'.
	self assert: posicao valorMedio equals: 0
	

]
