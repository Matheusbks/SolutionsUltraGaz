/****** Script do comando SelectTopNRows de SSMS  ******/

--Buscar novas movimenta��es
 SELECT
	   CONCAT(REPLACE(BI.[CC_FILIAL],'IO_',''),BI.FILTRO_CNPJ,BI.[DESCRICAO_ITEM_RESUMIDA]) AS 'Filial + CNPJ + Produto (CNPJ)',
	   CONCAT(BI.[CC_COD_CLIENTE],BI.[CC_COD_ENDERECO],REPLACE(BI.[CC_FILIAL],'IO_',''),BI.[DESCRICAO_ITEM_RESUMIDA]) AS 'CC_COD_CLIENTECC_COD_ENDERECOCCFILIALDESCRICAO_ITEM_RESUMIDA',
	   BI.[CC_COD_CLIENTE],
       BI.[CC_COD_ENDERECO],
       BI.[COD_CLIE_COD_END],
       REPLACE([CC_FILIAL],'IO_','') AS 'CCFILIAL',
       BI.[FILTRO_CNPJ],
	   TrimestreAnterior.[CNPJ Webtop],
       BI.[CC_RAZAO_SOCIAL],
       BI.[DESCRICAO_ITEM_RESUMIDA],	
	   ((TrimestreAnterior.CC_QTDE * 1)+( BI.CC_QTDE * 1)) AS 'CC_QTD', 
       TrimestreAnterior.[Qtd cliente CNPJ] AS 'Qtd cliente CNPJ',
	   TrimestreAnterior.[Qtd cliente endere�o] AS 'Qtd cliente endere�o',
	   TrimestreAnterior.Mercado AS 'Mercado',
	   TrimestreAnterior.[Saldo 4� Tri 2019],
	   TrimestreAnterior.[Status 4� Tri 2019],
	   TrimestreAnterior.[Saldo provisionado 4� Tri 2019],
	   0 AS 'Saldo 1� Tri 2020',
	   0 AS 'Status 1� Tri 2020',
	   0 AS 'Saldo provisionado 1� Tri 2020',
	   0 AS 'Status movimenta��o  1� Tri 2020',
	   0 As 'Qtd Doc  1� Tri 2020',
	   0 AS 'Status Doc  1� Tri 2020',
	   0 AS 'Detalhe pend�ncia Doc  1� Tri 2020',
	   0 AS 'Qtd NF 1� Tri 2020',	
	   0 AS 'Status NF 1� Tri 2020',
	   0 AS 'Detalhe pend�ncia NF 1� Tri 2020',
	   0 AS 'Status final 1� Tri 2020',
	   0 AS 'Historico',
	   0 AS 'Observa��es 1� Tri 2020',
	   0 AS 'Data de in�cio da an�lise 1� Tri 2020',
	   0 AS 'Data da �ltima an�lise 1� Tri 2020',
	   0 AS 'Respons�vel an�lise 1� Tri 2020',
	   0 AS 'Saldo a provisionar'

	  INTO #R1 
	  FROM [dbUltra].[dbo].['Gerencial - Domiciliar$'] AS BI
      left join [dbUltra].[dbo].Detalhamento$ AS TrimestreAnterior
      ON
      BI.CC_COD_CLIENTE = TrimestreAnterior.CC_COD_CLIENTE AND
      BI.CC_COD_ENDERECO = TrimestreAnterior.CC_COD_ENDERECO AND
      BI.DESCRICAO_ITEM_RESUMIDA = TrimestreAnterior.DESCRICAO_ITEM_RESUMIDA
      WHERE BI.FILTRO_CNPJ <> '061602199' AND  BI.FILTRO_CNPJ <> '046395687' AND  TrimestreAnterior.CC_QTDE IS NULL


		  SELECT 
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
		  0 AS 'CC_QTD',
		  #R1.[Qtd cliente CNPJ],
		  #R1.[Qtd cliente endere�o] AS 'Qtd cliente endere�o',
		  #R1.Mercado AS 'Mercado',
		  #R1.[Saldo 4� Tri 2019],
		  #R1.[Status 4� Tri 2019],
		  #R1.[Saldo provisionado 4� Tri 2019], 
		  #R1.[Saldo 1� Tri 2020],
		  #R1.[Status 1� Tri 2020],
		  #R1.[Saldo provisionado 1� Tri 2020],
		  'NOVA MOVIMENTA��O ' AS 'Status movimenta��o  1� Tri 2020',
		  #R1.[Qtd Doc  1� Tri 2020],
		  #R1.[Status Doc  1� Tri 2020],
		  #R1.[Detalhe pend�ncia Doc  1� Tri 2020],
		  #R1.[Qtd NF 1� Tri 2020],
		  #R1.[Status NF 1� Tri 2020],
		  #R1.[Detalhe pend�ncia NF 1� Tri 2020],
		  #R1.[Status final 1� Tri 2020],
		  #R1.[Historico],
		  #R1.[Observa��es 1� Tri 2020],
		  #R1.[Data de in�cio da an�lise 1� Tri 2020],
		  #R1.[Data da �ltima an�lise 1� Tri 2020],
		  #R1.[Respons�vel an�lise 1� Tri 2020],
		  #R1.[Saldo a provisionar]
		 INTO #R3 
		 FROM #R1 
		  
		  INNER JOIN Detalhamento$ AS TRIMESTREANTERIOR ON #R1.[Filial + CNPJ + Produto (CNPJ)] = TRIMESTREANTERIOR.[Filial + CNPJ + Produto (CNPJ)]

		  WHERE #R1.CC_COD_CLIENTE is NOT null


		  SELECT
	   CONCAT(REPLACE(BI.[CC_FILIAL],'IO_',''),BI.FILTRO_CNPJ,BI.[DESCRICAO_ITEM_RESUMIDA]) AS 'Filial + CNPJ + Produto (CNPJ)',
	   CONCAT(BI.[CC_COD_CLIENTE],BI.[CC_COD_ENDERECO],REPLACE(BI.[CC_FILIAL],'IO_',''),BI.[DESCRICAO_ITEM_RESUMIDA]) AS 'CC_COD_CLIENTECC_COD_ENDERECOCCFILIALDESCRICAO_ITEM_RESUMIDA',
	   BI.[CC_COD_CLIENTE],
       BI.[CC_COD_ENDERECO],
       BI.[COD_CLIE_COD_END],
       REPLACE([CC_FILIAL],'IO_','') AS 'CCFILIAL',
       BI.[FILTRO_CNPJ],
	   TrimestreAnterior.[CNPJ Webtop],
       BI.[CC_RAZAO_SOCIAL],
       BI.[DESCRICAO_ITEM_RESUMIDA],
	   ((TrimestreAnterior.CC_QTDE * 1)+( BI.CC_QTDE * 1)) AS 'CC_QTD', 
       TrimestreAnterior.[Qtd cliente CNPJ] AS 'Qtd cliente CNPJ',
	   TrimestreAnterior.[Qtd cliente endere�o] AS 'Qtd cliente endere�o',
	   TrimestreAnterior.Mercado AS 'Mercado',
	   TrimestreAnterior.[Saldo 4� Tri 2019],
	   TrimestreAnterior.[Status 4� Tri 2019],
	   TrimestreAnterior.[Saldo provisionado 4� Tri 2019],
	   ((TrimestreAnterior.CC_QTDE * 1)+( BI.CC_QTDE * 1)) AS 'Saldo 1� Tri 2020',
	   CASE
			WHEN 
			((TrimestreAnterior.CC_QTDE * 1)+( BI.CC_QTDE * 1)) < BI.CC_QTDE 
			THEN
				'Aumento de saldo'		
			WHEN
				((TrimestreAnterior.CC_QTDE * 1)+( BI.CC_QTDE * 1)) > BI.CC_QTDE
		    THEN
				'Redu��o de saldo'
			WHEN 
				((TrimestreAnterior.CC_QTDE * 1)+( BI.CC_QTDE * 1)) = 0
			THEN 
			    'Manteve o saldo'
			END
			 AS 'Status 1� Tri 2020',
	   0 AS 'Saldo provisionado 1� Tri 2020',
	  '-'AS 'Status movimenta��o  1� Tri 2020',
	   0 AS 'Qtd Doc  1� Tri 2020',
	   0 AS 'Status Doc  1� Tri 2020',
	   0 AS 'Detalhe pend�ncia Doc  1� Tri 2020',
	   0 AS 'Qtd NF 1� Tri 2020',
	   0 AS 'Status NF 1� Tri 2020',
	   0 AS 'Detalhe pend�ncia NF 1� Tri 2020',
	   0 AS 'Status final 1� Tri 2020',
	   0 AS 'Historico',
	   0 AS 'Observa��es 1� Tri 2020',
	   0 AS 'Data de in�cio da an�lise 1� Tri 2020',
	   0 AS 'Data da �ltima an�lise 1� Tri 2020',
	   0 AS 'Respons�vel an�lise 1� Tri 2020',
	   0 AS 'Saldo a provisionar'
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