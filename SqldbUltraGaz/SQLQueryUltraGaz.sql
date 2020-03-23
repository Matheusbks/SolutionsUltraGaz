SELECT *  FROM [dbUltra].[dbo].['Gerencial - Domiciliar$']

  select 
	TrimestreAnterior.CC_COD_CLIENTE as 'TrimestreAnterior',
	BI.CC_COD_CLIENTE as 'BI',
	TrimestreAnterior.CC_RAZAO_SOCIAL,
	TrimestreAnterior.CCFILIAL,
	TrimestreAnterior.DESCRICAO_ITEM_RESUMIDA,
	TrimestreAnterior.CC_QTDE as 'TrimestreAnterior',
	BI.CC_QTDE as 'BI',

	--faz a conta =-20
	((TrimestreAnterior.CC_QTDE * 1)+( BI.CC_QTDE * 1)) as 'comparacao' 
  from [dbUltra].[dbo].['Gerencial - Domiciliar$'] as BI
  inner join [dbUltra].[dbo].Detalhamento$ as TrimestreAnterior
  on 
   BI.CC_COD_CLIENTE = TrimestreAnterior.CC_COD_CLIENTE AND
   BI.CC_COD_ENDERECO = TrimestreAnterior.CC_COD_ENDERECO AND
   BI.DESCRICAO_ITEM_RESUMIDA = TrimestreAnterior.DESCRICAO_ITEM_RESUMIDA