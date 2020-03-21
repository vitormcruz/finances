Class {
	#name : #AcoesUnitTest,
	#superclass : #TestCase,
	#category : #'Finances-Tests'
}

{ #category : #tests }
AcoesUnitTest >> testa_obter_operacoes_por_ticker_inexistente [

	self assert: (AcoesInMemory new acaoDoTicker: 'FAKE') operacoes isEmpty.
]

{ #category : #tests }
AcoesUnitTest >> testa_obter_operacoes_por_ticker_possuidor_N_operacoes [
	| acoes operacoesIBOV3 data acao |
	
	acoes := AcoesInMemory new.
	data := Date today.
	
	acao := acoes acaoDoTicker: 'IBOV3'.
	
	acao comprar: 200 em: data totalizando: 1000.
	acao comprar: 100 em: (data + 1) asDate totalizando: 23456.
	acao comprar: 1000 em: (data + 2) asDate totalizando: 100000.
	
	operacoesIBOV3 := acao operacoes collect: [ :op | 
		'{1} {2} {3} {4}' format: {op acao ticker. op lote. op data yyyymmdd. op total.}
	].
		
	self assert: operacoesIBOV3 asSet equals: {'IBOV3 200 ', data yyyymmdd  , ' 1000'.
												  		  'IBOV3 100 ', (data + 1) asDate yyyymmdd  , ' 23456'.
												  		  'IBOV3 1000 ', (data + 2) asDate yyyymmdd  , ' 100000'.} asSet .

]

{ #category : #tests }
AcoesUnitTest >> testa_obter_operacoes_por_ticker_possuidor_uma_operacao [
	| acoes operacoesIBOV data operacaoObtida acao|
	
	acoes := AcoesInMemory new.
	data := Date today.
	
	acao := acoes acaoDoTicker: 'IBOV3'.
	
	acao comprar: 100 em: data totalizando: 1000.
	operacoesIBOV := acao operacoes.
	self assert: operacoesIBOV size equals: 1.
	
	operacaoObtida := operacoesIBOV at: 1.
	self assert: operacaoObtida acao ticker equals: 'IBOV3'.
	self assert: operacaoObtida lote equals: 100.
	self assert: operacaoObtida data equals: data.
	self assert: operacaoObtida total equals: 1000.
]

{ #category : #tests }
AcoesUnitTest >> testa_ordem_operacoes [

"Depois tem que ver como fazer isso quando existir operações positivas e negativas."
]

{ #category : #tests }
AcoesUnitTest >> testa_valorMedio_com_N_operacoes_positivas_sem_nunca_zerar_posicao [

	| acao |
	
	acao := AcoesInMemory new acaoDoTicker: 'IBOV3'.
	acao comprar: 100 em: Date today totalizando: 1000.
	acao comprar: 100 em: Date today totalizando: 2000.
	acao comprar: 100 em: Date today totalizando: 3000.
	self assert: acao valorMedio equals: 20
	

]

{ #category : #tests }
AcoesUnitTest >> testa_valorMedio_com_uma_operacao [

	| acao |
	
	acao := AcoesInMemory new acaoDoTicker: 'IBOV3'.
	acao comprar: 100 em: Date today totalizando: 1000.
	self assert: acao valorMedio equals: 10
	

]

{ #category : #tests }
AcoesUnitTest >> testa_valorMedio_sem_operacoes [

	| acao |
	
	acao := AcoesInMemory new acaoDoTicker: 'IBOV3'.
	self assert: acao valorMedio equals: 0
	

]
