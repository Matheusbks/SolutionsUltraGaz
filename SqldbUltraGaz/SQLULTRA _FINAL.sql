/****** Script do comando SelectTopNRows de SSMS  ******/

--Buscar novas movimentações
 SELECT
	   CONCAT(REPLACE(BI.[CC_FILIAL],'IO_',''),BI.FILTRO_CNPJ,BI.[DESCRICAO_ITEM_RESUMIDA]) AS 'Filial + CNPJ + Produto (CNPJ)',
	   CONCAT(BI.[CC_COD_CLIENTE],BI.[CC_COD_ENDERECO],REPLACE(BI.[CC_FILIAL],'IO_',''),BI.[DESCRICAO_ITEM_RESUMIDA]) as 'CC_COD_CLIENTECC_COD_ENDERECOCCFILIALDESCRICAO_ITEM_RESUMIDA',
	   BI.[CC_COD_CLIENTE],
       BI.[CC_COD_ENDERECO],
       BI.[COD_CLIE_COD_END],
       REPLACE([CC_FILIAL],'IO_','') as 'CCFILIAL',
       BI.[FILTRO_CNPJ],
	   TrimestreAnterior.[CNPJ Webtop],
       BI.[CC_RAZAO_SOCIAL],
       BI.[DESCRICAO_ITEM_RESUMIDA],	
	   ((TrimestreAnterior.CC_QTDE * 1)+( BI.CC_QTDE * 1)) as 'CC_QTD', 
       TrimestreAnterior.[Qtd cliente CNPJ] as 'Qtd cliente CNPJ',
	   TrimestreAnterior.[Qtd cliente endereço] as 'Qtd cliente endereço',
	   TrimestreAnterior.Mercado as 'Mercado',
	   TrimestreAnterior.[Saldo 4º Tri 2019],
	   TrimestreAnterior.[Status 4º Tri 2019],
	   TrimestreAnterior.[Saldo provisionado 4º Tri 2019],
	   0 as 'Saldo 1º Tri 2020',
	   0 as 'Status 1º Tri 2020',
	   0 as 'Saldo provisionado 1º Tri 2020',
	   0 as 'Status movimentação  1º Tri 2020',
	   0 as 'Qtd Doc  1º Tri 2020',
	   0 as 'Status Doc  1º Tri 2020',
	   0 as 'Detalhe pendência Doc  1º Tri 2020',
	   0 as 'Qtd NF 1º Tri 2020',	
	   0 as 'Status NF 1º Tri 2020',
	   0 as 'Detalhe pendência NF 1º Tri 2020',
	   0 as 'Status final 1º Tri 2020',
	   0 as 'Historico',
	   0 as 'Observações 1º Tri 2020',
	   0 as 'Data de início da análise 1º Tri 2020',
	   0 as 'Data da última análise 1º Tri 2020',
	   0 as 'Responsável análise 1º Tri 2020',
	   0 as 'Saldo a provisionar'

	  INTO #R1 
	  FROM [dbUltra].[dbo].['Gerencial - Domiciliar$'] as BI
      left join [dbUltra].[dbo].Detalhamento$ as TrimestreAnterior
      on
      BI.CC_COD_CLIENTE = TrimestreAnterior.CC_COD_CLIENTE AND
      BI.CC_COD_ENDERECO = TrimestreAnterior.CC_COD_ENDERECO AND
      BI.DESCRICAO_ITEM_RESUMIDA = TrimestreAnterior.DESCRICAO_ITEM_RESUMIDA
      WHERE BI.FILTRO_CNPJ <> '061602199' AND  BI.FILTRO_CNPJ <> '046395687' AND  TrimestreAnterior.CC_QTDE IS NULL


		  select 
		  #R1.[Filial + CNPJ + Produto (CNPJ)], 
		  #R1.CC_COD_CLIENTECC_COD_ENDERECOCCFILIALDESCRICAO_ITEM_RESUMIDA,
		  #R1.[CC_COD_CLIENTE],
		  #R1.[CC_COD_ENDERECO],
		  #R1.[COD_CLIE_COD_END],
		  #R1.CCFILIAL,
		  #R1.[FILTRO_CNPJ],
		  #R1.[CNPJ Webtop],
		  #R1.[CC_RAZAO_SOCIAL],
		  #R1.[DESCRICAO_ITEM_RESUMIDA],
		  0 as 'CC_QTD',
		  #R1.[Qtd cliente CNPJ],
		  #R1.[Qtd cliente endereço] as 'Qtd cliente endereço',
		  #R1.Mercado as 'Mercado',
		  #R1.[Saldo 4º Tri 2019],
		  #R1.[Status 4º Tri 2019],
		  #R1.[Saldo provisionado 4º Tri 2019], 
		  #R1.[Saldo 1º Tri 2020],
		  #R1.[Status 1º Tri 2020],
		  #R1.[Saldo provisionado 1º Tri 2020],
		  'NOVA MOVIMENTAÇÃO ' AS 'Status movimentação  1º Tri 2020',
		  #R1.[Qtd Doc  1º Tri 2020],
		  #R1.[Status Doc  1º Tri 2020],
		  #R1.[Detalhe pendência Doc  1º Tri 2020],
		  #R1.[Qtd NF 1º Tri 2020],
		  #R1.[Status NF 1º Tri 2020],
		  #R1.[Detalhe pendência NF 1º Tri 2020],
		  #R1.[Status final 1º Tri 2020],
		  #R1.[Historico],
		  #R1.[Observações 1º Tri 2020],
		  #R1.[Data de início da análise 1º Tri 2020],
		  #R1.[Data da última análise 1º Tri 2020],
		  #R1.[Responsável análise 1º Tri 2020],
		  #R1.[Saldo a provisionar]
		 INTO #R3 
		 FROM #R1 
		  
		  INNER JOIN Detalhamento$ AS TRIMESTREANTERIOR on #R1.[Filial + CNPJ + Produto (CNPJ)] = TRIMESTREANTERIOR.[Filial + CNPJ + Produto (CNPJ)]

		  WHERE #R1.CC_COD_CLIENTE is NOT null


		  SELECT
	   CONCAT(REPLACE(BI.[CC_FILIAL],'IO_',''),BI.FILTRO_CNPJ,BI.[DESCRICAO_ITEM_RESUMIDA]) AS 'Filial + CNPJ + Produto (CNPJ)',
	   CONCAT(BI.[CC_COD_CLIENTE],BI.[CC_COD_ENDERECO],REPLACE(BI.[CC_FILIAL],'IO_',''),BI.[DESCRICAO_ITEM_RESUMIDA]) as 'CC_COD_CLIENTECC_COD_ENDERECOCCFILIALDESCRICAO_ITEM_RESUMIDA',
	   BI.[CC_COD_CLIENTE],
       BI.[CC_COD_ENDERECO],
       BI.[COD_CLIE_COD_END],
       REPLACE([CC_FILIAL],'IO_','') as 'CCFILIAL',
       BI.[FILTRO_CNPJ],
	   TrimestreAnterior.[CNPJ Webtop],
       BI.[CC_RAZAO_SOCIAL],
       BI.[DESCRICAO_ITEM_RESUMIDA],
	   ((TrimestreAnterior.CC_QTDE * 1)+( BI.CC_QTDE * 1)) as 'CC_QTD', 
       TrimestreAnterior.[Qtd cliente CNPJ] as 'Qtd cliente CNPJ',
	   TrimestreAnterior.[Qtd cliente endereço] as 'Qtd cliente endereço',
	   TrimestreAnterior.Mercado as 'Mercado',
	   TrimestreAnterior.[Saldo 4º Tri 2019],
	   TrimestreAnterior.[Status 4º Tri 2019],
	   TrimestreAnterior.[Saldo provisionado 4º Tri 2019],
	   ((TrimestreAnterior.CC_QTDE * 1)+( BI.CC_QTDE * 1)) as 'Saldo 1º Tri 2020',
	   case
			when 
			((TrimestreAnterior.CC_QTDE * 1)+( BI.CC_QTDE * 1)) < BI.CC_QTDE 
			then 
				'Aumento de saldo'		
			when 
				((TrimestreAnterior.CC_QTDE * 1)+( BI.CC_QTDE * 1)) > BI.CC_QTDE
			then
				'Redução de saldo'
			when 
				((TrimestreAnterior.CC_QTDE * 1)+( BI.CC_QTDE * 1)) = 0
			then 
			    'Manteve o saldo'
			end
			 as 'Status 1º Tri 2020',
	   0 as 'Saldo provisionado 1º Tri 2020',
	  '-'as 'Status movimentação  1º Tri 2020',
	   0 as 'Qtd Doc  1º Tri 2020',
	   0 as 'Status Doc  1º Tri 2020',
	   0 as 'Detalhe pendência Doc  1º Tri 2020',
	   0 as 'Qtd NF 1º Tri 2020',
	   0 as 'Status NF 1º Tri 2020',
	   0 as 'Detalhe pendência NF 1º Tri 2020',
	   0 as 'Status final 1º Tri 2020',
	   0 as 'Historico',
	   0 as 'Observações 1º Tri 2020',
	   0 as 'Data de início da análise 1º Tri 2020',
	   0 as 'Data da última análise 1º Tri 2020',
	   0 as 'Responsável análise 1º Tri 2020',
	   0 as 'Saldo a provisionar'
	   INTO #R2
	 FROM [dbUltra].[dbo].['Gerencial - Domiciliar$'] as BI
     left join [dbUltra].[dbo].Detalhamento$ as TrimestreAnterior

     ON
      BI.CC_COD_CLIENTE = TrimestreAnterior.CC_COD_CLIENTE AND
      BI.CC_COD_ENDERECO = TrimestreAnterior.CC_COD_ENDERECO AND
      BI.DESCRICAO_ITEM_RESUMIDA = TrimestreAnterior.DESCRICAO_ITEM_RESUMIDA
      WHERE BI.FILTRO_CNPJ <> '061602199' AND  BI.FILTRO_CNPJ <> '046395687' AND TrimestreAnterior.CC_QTDE IS not NULL
	  
	  INSERT INTO #R2 SELECT * FROM #R3	

	 -- SELECT * from #R2

	-- DROP TABLE #R1, #R2,#R3


		
	  SELECT * FROM #R2
	  SELECT * FROM #R3	