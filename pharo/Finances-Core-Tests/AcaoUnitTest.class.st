Class {
	#name : #AcaoUnitTest,
	#superclass : #TestCase,
	#category : #'Finances-Core-Tests'
}

{ #category : #'tests - inicialização' }
AcaoUnitTest >> testa_inicializar_acao_comprada [

	| acao |
	
	acao := (Acao newParaTicker: 'BOVA11') comprar: 100 
													  em: DateAndTime now 
													  totalizando: 1000; 
				yourself .
	
	self assert: (acao isKindOf: AcaoComprada).
]

{ #category : #'tests - inicialização' }
AcaoUnitTest >> testa_inicializar_acao_vendida [

	| acao |
	
	acao := (Acao newParaTicker: 'BOVA11') vender: 100 
													  em: DateAndTime now 
													  totalizando: 1000;
				yourself.

	self assert: (acao isKindOf: AcaoVendida).	
]

{ #category : #'tests - get operacao' }
AcaoUnitTest >> testa_obter_operacoes_por_ticker_inexistente [

	self assert: (AcoesInMemory new acaoDoTicker: 'FAKE') operacoes isEmpty.
]

{ #category : #'tests - get operacao' }
AcaoUnitTest >> testa_obter_operacoes_por_ticker_possuidor_N_operacoes [
	| acoes operacoesIBOV3 data acao |
	
	acoes := AcoesInMemory new.
	data := Date today.
	
	acao := acoes acaoDoTicker: 'IBOV3'.
	
	acao comprar: 200 em: data totalizando: 1000.
	acao comprar: 100 em: (data + 1) asDate totalizando: 23456.
	acao comprar: 1000 em: (data + 2) asDate totalizando: 100000.
	
	operacoesIBOV3 := acao operacoes collect: [ :op | 
		'{1} {2} {3}' format: {op lote. op data yyyymmdd. op total.}
	].
		
	self assert: operacoesIBOV3 asSet equals: {'200 ', data yyyymmdd  , ' 1000'.
												  		   '100 ', (data + 1) asDate yyyymmdd  , ' 23456'.
												  		   '1000 ', (data + 2) asDate yyyymmdd  , ' 100000'.} asSet .

]

{ #category : #'tests - get operacao' }
AcaoUnitTest >> testa_obter_operacoes_por_ticker_possuidor_uma_operacao [
	| acoes operacoesIBOV data operacaoObtida acao|
	
	acoes := AcoesInMemory new.
	data := Date today.
	
	acao := acoes acaoDoTicker: 'IBOV3'.
	
	acao comprar: 100 em: data totalizando: 1000.
	operacoesIBOV := acao operacoes.
	self assert: operacoesIBOV size equals: 1.
	
	operacaoObtida := operacoesIBOV at: 1.
	self assert: operacaoObtida lote equals: 100.
	self assert: operacaoObtida data equals: data.
	self assert: operacaoObtida total equals: 1000.
]

{ #category : #'tests - ordem das operacoes' }
AcaoUnitTest >> testa_ordem_operacoes [

"Depois tem que ver como fazer isso quando existir operações positivas e negativas."

	self skip.
]

{ #category : #'tests - comprada/vendida' }
AcaoUnitTest >> testa_seComprada_apenas_com_operacao_inicial_de_compra [
	| acao |
	
	acao := Acao newParaTicker: 'TESTE'.
	acao comprar: 100 em: DateAndTime today totalizando: 10000.
	self assert: (acao seComprada: [ true ]).
]

{ #category : #'tests - comprada/vendida' }
AcaoUnitTest >> testa_seComprada_com_N_operacoes_sendo_a_inicial_de_compra [
	| acao |
	
	acao := Acao newParaTicker: 'TESTE'.
	acao comprar: 100 em: DateAndTime today totalizando: 10000.
	acao comprar: 100 em: DateAndTime today totalizando: 10000.
	acao vender: 100 em: DateAndTime today totalizando: 10000.
	
	self assert: (acao seComprada: [ true ]).
]

{ #category : #'tests - comprada/vendida' }
AcaoUnitTest >> testa_seComprada_com_operacao_inicial_de_venda [
	| acao |
	
	acao := Acao newParaTicker: 'TESTE'.
	acao vender: 100 em: DateAndTime today totalizando: 10000.
	self assert: (acao seComprada: [ true ]) equals: nil
]

{ #category : #'tests - comprada/vendida' }
AcaoUnitTest >> testa_seComprada_sem_operacao [

	self assert: ((Acao newParaTicker: 'TESTE') seComprada: [ true ])
		  equals: nil.	
]

{ #category : #'tests - comprada/vendida' }
AcaoUnitTest >> testa_seVendida_apenas_com_operacao_inicial_de_venda [
	| acao |
	
	acao := Acao newParaTicker: 'TESTE'.
	acao vender: 100 em: DateAndTime today totalizando: 10000.
	self assert: (acao seVendida: [ true ])
]

{ #category : #'tests - comprada/vendida' }
AcaoUnitTest >> testa_seVendida_com_N_operacoes_sendo_a_inicial_de_venda [
	| acao |
	
	acao := Acao newParaTicker: 'TESTE'.
	acao vender: 100 em: DateAndTime today totalizando: 10000.
	acao comprar: 100 em: DateAndTime today totalizando: 10000.
	acao comprar: 100 em: DateAndTime today totalizando: 10000.
	self assert: (acao seVendida: [ true ])
]

{ #category : #'tests - comprada/vendida' }
AcaoUnitTest >> testa_seVendida_com_operacao_inicial_de_compra [
	| acao |
	
	acao := Acao newParaTicker: 'TESTE'.
	acao comprar: 100 em: DateAndTime today totalizando: 10000.
	self assert: (acao seVendida: [ true ]) equals: nil
]

{ #category : #'tests - comprada/vendida' }
AcaoUnitTest >> testa_seVendida_sem_operacao [

	self assert: ((Acao newParaTicker: 'TESTE') seVendida: [ true ])
		  equals: nil.	
]

{ #category : #'tests - valor medio' }
AcaoUnitTest >> testa_valorMedio_com_N_operacoes_positivas_sem_nunca_zerar_posicao [

	| acao |
	
	acao := AcoesInMemory new acaoDoTicker: 'IBOV3'.
	acao comprar: 100 em: Date today totalizando: 1000.
	acao comprar: 100 em: Date today totalizando: 2000.
	acao comprar: 100 em: Date today totalizando: 3000.
	self assert: acao valorMedio equals: 20
	

]

{ #category : #'tests - valor medio' }
AcaoUnitTest >> testa_valorMedio_com_N_operacoes_zerarando_posicao [

	| acao operacao |
	
	acao := AcoesInMemory new acaoDoTicker: 'IBOV3'.
	acao comprar: 100 em: DateAndTime now totalizando: 1000.
	acao comprar: 100 em: DateAndTime now totalizando: 1000.
	acao comprar: 100 em: DateAndTime now totalizando: 1000.
	operacao := acao vender: 300 em: DateAndTime now totalizando: 4000.
	self assert: acao valorMedio equals: 0.	

]

{ #category : #'tests - valor medio' }
AcaoUnitTest >> testa_valorMedio_com_uma_operacao_compra [

	| acao |
	
	acao := AcoesInMemory new acaoDoTicker: 'IBOV3'.
	acao comprar: 100 em: Date today totalizando: 1000.
	self assert: acao valorMedio equals: 10
	

]

{ #category : #'tests - valor medio' }
AcaoUnitTest >> testa_valorMedio_com_uma_operacao_venda [

	| acao |
	
	acao := AcoesInMemory new acaoDoTicker: 'IBOV3'.
	acao vender: 100 em: Date today totalizando: 1000.
	self assert: acao valorMedio equals: 10
	

]

{ #category : #'tests - valor medio' }
AcaoUnitTest >> testa_valorMedio_sem_operacoes [

	| acao |
	
	acao := AcoesInMemory new acaoDoTicker: 'IBOV3'.
	self assert: acao valorMedio equals: 0
	

]