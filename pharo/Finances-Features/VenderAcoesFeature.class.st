"
Eu como Investidor
Desejo realizar operações de venda de ações
E acompanhar os seus resultados.
"
Class {
	#name : #VenderAcoesFeature,
	#superclass : #SbddFeature,
	#instVars : [
		'acoes'
	],
	#category : #'Finances-Features'
}

{ #category : #scenarios }
VenderAcoesFeature >> Liquidar_parcialmente_açoes_ja_adquiridas [
	<scenarioOutline>
	^ self
		scenarioOutline: 'Ao vender apenas parte das ações préviamente adiquiridas de uma empresa, 
							  todos os indicadores — lotes, valor médio e montante — são atualizados e um resultado 
							  é gerado naquela data'
			   		  def: 'Dado que comprei "400" ações de "BOVA11" por R$ "4000"
							  Quando vendo hoje "{qtdVendida}" ações por R$ "{valorVenda}"
							  Então agora possuo "{qtdRemanescente}" acoes com valor médio de "10" e 
							  uma operação com resultado de R$"{resultadoEmReais}" e montante remanescente de 
							  "{montanteRemanescente}"'
							
				examples: 	#( qtdVendida    valorVenda   qtdRemanescente   resultadoEmReais  montanteRemanescente) asHeaderFor
							 - #(   100            1000           300  			 	 		0   					3000        )
							 - #(   100            2000				 300				 	  1000        			3000			)
							 - #(   200            2000				 200					   0 		        		2000 			)
							
					  run: [ :qtdAcoesCompradas :ticker :montante :qtdVendida :valorVenda 
								:qtdRemanescente :valorMedioEsperado :resultadoEmReais :montanteRemanescente | 
			
						| acao hoje operacao |
						
						hoje := DateAndTime now.
						acao := (acoes acaoDoTicker: ticker).
						acao comprar: qtdAcoesCompradas 
							  em: hoje - 90 days 
							  totalizando: montante.
						
						operacao := acao vender: qtdVendida 
							  			  	  em: DateAndTime now
							  				  totalizando: valorVenda.
						
						self assert: acao totalAcoes equals: qtdRemanescente.
						self assert: acao valorMedio equals: valorMedioEsperado.
						self assert: operacao resultado equals: resultadoEmReais.
						self assert: acao montanteTotal equals: montanteRemanescente.
					]
]

{ #category : #scenarios }
VenderAcoesFeature >> Liquidar_todas_as_açoes_adquiridas [
	<scenarioOutline>
	^ self
		scenarioOutline: 'Ao vender todas as ações préviamente adiquiridas de uma empresa, 
							  o valor médio da ação vai a zero e um resultado é gerado naquela data'
			   		  def: 'Dado que comprei "100" ações de "BOVA11" por R$ "1000"
							  Quando vendo essas 100 ações por R$ "{valorVenda}"
							  Então agora possuo "0" acoes com valor médio de R$ "0" 
							  e uma operação R$"{resultadoEmReais}" de resultado'
							
				examples: 	#(  valorVenda      resultadoEmReais ) asHeaderFor
							 - #(    10000               9000       )
							 - #(    1000                 0         )
							 - #(    500                 -500       )
							
					  run: [ :qtdAcoesCompradas :ticker :montante :valorVenda :acoesRestantes 
							   :novoValorMedio :resultadoEmReais | 
			
						| acao hoje operacao |
						
						hoje := DateAndTime now.
						acao := (acoes acaoDoTicker: ticker).
						acao comprar: qtdAcoesCompradas 
							  em: hoje - 90 days 
							  totalizando: montante.
						
						operacao := acao vender: qtdAcoesCompradas 
							  			  	  em: DateAndTime now
							  				  totalizando: valorVenda.
						
						self assert: acao totalAcoes equals: acoesRestantes.
						self assert: acao valorMedio equals: novoValorMedio.
						self assert: operacao resultado equals: resultadoEmReais.
					]
]

{ #category : #running }
VenderAcoesFeature >> setUp [
	super setUp.
	acoes := AcoesInMemory new.


]
