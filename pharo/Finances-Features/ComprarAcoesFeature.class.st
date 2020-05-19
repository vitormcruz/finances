"
Eu como Investidor
Desejo realizar operações de venda de ações
E acompanhar os seus resultados.
"
Class {
	#name : #ComprarAcoesFeature,
	#superclass : #SbddFeature,
	#instVars : [
		'posicoes'
	],
	#category : #'Finances-Features'
}

{ #category : #scenarios }
ComprarAcoesFeature >> Comprar_mais_acoes_ja_adquiridas_anteriormente [
	<scenarioOutline>
	^ self
		scenarioOutline: 'Incrementar investimentos em ações altera o montante, lote em posse e 
								valor médio das ações de maneira apropriada.'
			   		  def:  'Dado que tenho "100" ações de "BOVA11" compradas por R$ "10000"
								Quando compro mais "{loteAdicional}" por "{montanteAdicional}"
						      Então agora possuo "{qtdAcoesAtual}" acoes no valor médio de R$ "{novoValorMedio}"'
							
				examples: 	#( loteAdicional   montanteAdicional  qtdAcoesAtual    novoValorMedio ) asHeaderFor
							 - #(    100             5000              200                 75        )
							 - #(    500             20000             600                 50        )
							 - #(    10              2100              110                 110       )
							
					  run: [ :qtdAtual :ticker :montanteAtual :loteAdicional 
								:montanteAdicional :qtdAcoesAtualEsperado :novoValorMedio  | 
			
						| posicao |
						
						posicao := (posicoes ativaDoTicker: ticker doTipo: #Comprada).
						(Lancamento ticker: ticker lote: qtdAtual data: DateAndTime today valor: montanteAtual) processaOperacoesPara: posicoes.
						(Lancamento ticker: ticker lote: loteAdicional data: DateAndTime today valor: montanteAdicional) processaOperacoesPara: posicoes.
						
						self assert: posicao totalAcoes equals: qtdAcoesAtualEsperado.
						self assert: posicao valorMedio equals: novoValorMedio.
					]
]

{ #category : #scenarios }
ComprarAcoesFeature >> Primeira_compra [
	<scenarioOutline>
	^ self
		scenarioOutline: 'Ao comprar uma ação pela primeira vez, o valor da operação é armazenado e o valor médio 
							  é esse número dividido pela quantidade (lote) de ações compradas'
			   		  def:  'Quando compro "{lote}" ações de BOV11 no total de R$ "{montante}" em 12/01/2019
						      Então nesta operação o valor da ação de "BOV11" foi de "{valorAcaoOperacao}"
							   E o valor médio dessas ações passa a ser de "{valorMedio}"'
							
				examples: 	#(  lote    montante  valorAcaoOperacao    valorMedio) asHeaderFor
							 - #(  1000      10000          10                10    )
							 - #(  2000      500            0.25              0.25  )
							 - #(  10       10000           1000              1000  )
							
					  run: [ :lote :montante :ticker :valorAcaoOperacao :valorMedio | 
						| operacao posicao |
			
						posicao := posicoes ativaDoTicker: ticker doTipo: #Comprada.
						
						operacao := (Lancamento ticker: ticker 
													   lote: lote 
													   data: (Date readFrom: '12/01/2019' pattern: 'dd/mm/yyyy') 
													   valor: montante) processaOperacoesPara: posicoes.
													
						self assert: operacao valorUnitarioAcao equals: valorAcaoOperacao.
						self assert: posicao valorMedio equals: valorMedio 
					]
]

{ #category : #running }
ComprarAcoesFeature >> setUp [
	super setUp.
	posicoes := PosicoesInMemory new.
]
