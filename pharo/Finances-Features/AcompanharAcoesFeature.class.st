"
Eu como Investidor
Desejo Investir em ações
E acompanhar a rentabilidade obtive entre operacoes de compra e venda.
"
Class {
	#name : #AcompanharAcoesFeature,
	#superclass : #SbddFeature,
	#instVars : [
		'acoes'
	],
	#category : #'Finances-Features'
}

{ #category : #scenarios }
AcompanharAcoesFeature >> Incrementa_investimento_em_uma_acao [
	<scenarioOutline>
	^ self
		scenarioOutline: 'Incrementar investimentos em ações altera o montante, lote em posse e 
								valor médio das ações de maneira apropriada.'
			   		  def:  'Dado que tenho "100" ações de "IBOV3" compradas por R$ "10000"
								Quando compro mais "{loteAdicional}" por "{montanteAdicional}"
						      Então agora possuo "{qtdAcoesAtual}" acoes no valor médio de R$ "{novoValorMedio}"'
							
				examples: 	#( loteAdicional   montanteAdicional  qtdAcoesAtual    novoValorMedio ) asHeaderFor
							 - #(    100             5000              200                 75        )
							 - #(    500             20000             600                 50        )
							 - #(    10              50                150                 67        )
							
					  run: [ :qtdAtual :ticker :montanteAtual :loteAdicional 
								:montanteAdicional :qtdAcoesAtualEsperado :novoValorMedio  | 
			
						| acao |
						
						acao := (acoes acaoDoTicker: ticker).
						acao comprar: qtdAtual em: DateAndTime today totalizando: montanteAtual;
						     comprar: loteAdicional em: DateAndTime today totalizando: montanteAdicional.
						
						self assert: acao totalAcoes equals: qtdAcoesAtualEsperado.
						self assert: acao valorMedio equals: novoValorMedio.
					]
]

{ #category : #scenarios }
AcompanharAcoesFeature >> Investir_numa_nova_acao [
	<scenarioOutline>
	^ self
		scenarioOutline: 'O total investido em novas ações dividido pela quantidade comprada é igual ao valor médio de cada ação.'
			   		  def:  'Quando compro "{lote}" ações de IBOV3 no total de R$ "{montante}" em 12/01/2019
						      Então nesta operação o valor da ação de "IBOV3" foi de "{valorAcaoOperacao}"
							   E o valor médio dessas ações passa a ser de "{valorMedio}"'
							
				examples: 	#(  lote    montante  valorAcaoOperacao    valorMedio) asHeaderFor
							 - #(  1000      10000          10                10    )
							 - #(  2000      500            0.25              0.25  )
							 - #(  10       10000           1000              1000  )
							
					  run: [ :lote :montante :ticker :valorAcaoOperacao :valorMedio | 
						| operacao acao |
			
						acao := acoes acaoDoTicker: ticker.
						operacao := acao comprar: lote em: (Date readFrom: '12/01/2019' pattern: 'dd/mm/yyyy') totalizando: montante.
						self assert: operacao valorUnitarioAcao equals: valorAcaoOperacao.
						self assert: acao valorMedio equals: valorMedio 
					]
]

{ #category : #running }
AcompanharAcoesFeature >> setUp [

	acoes := AcoesInMemory new.
	super setUp.

]
