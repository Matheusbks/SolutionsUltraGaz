USE [dbUltra]
GO
/****** Object:  Table [dbo].[Detalhamento$]    Script Date: 23/03/2020 13:50:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Detalhamento$](
	[Filial + CNPJ + Produto (CNPJ)] [nvarchar](255) NULL,
	[CC_COD_CLIENTECC_COD_ENDERECOCCFILIALDESCRICAO_ITEM_RESUMIDA] [nvarchar](255) NULL,
	[CC_COD_CLIENTE] [nvarchar](255) NULL,
	[CC_COD_ENDERECO] [nvarchar](255) NULL,
	[COD_CLIE_COD_END] [nvarchar](255) NULL,
	[CCFILIAL] [nvarchar](255) NULL,
	[FILTRO_CNPJ] [nvarchar](255) NULL,
	[CNPJ Webtop] [nvarchar](255) NULL,
	[CC_RAZAO_SOCIAL] [nvarchar](255) NULL,
	[DESCRICAO_ITEM_RESUMIDA] [nvarchar](255) NULL,
	[CC_QTDE] [float] NULL,
	[Qtd cliente CNPJ] [float] NULL,
	[Qtd cliente endereço] [float] NULL,
	[Mercado] [nvarchar](255) NULL,
	[Saldo 4º Tri 2019] [float] NULL,
	[Status 4º Tri 2019] [nvarchar](255) NULL,
	[Saldo provisionado 4º Tri 2019] [nvarchar](255) NULL,
	[Status movimentação  1º Tri 2020] [nvarchar](255) NULL,
	[Qtd Doc  1º Tri 2020] [nvarchar](255) NULL,
	[Status Doc  1º Tri 2020] [nvarchar](255) NULL,
	[Detalhe pendência Doc  1º Tri 2020] [nvarchar](255) NULL,
	[Qtd NF 1º Tri 2020] [nvarchar](255) NULL,
	[Status NF 1º Tri 2020] [nvarchar](255) NULL,
	[Detalhe pendência NF 1º Tri 2020] [nvarchar](255) NULL,
	[Status final 1º Tri 2020] [nvarchar](255) NULL,
	[Historico] [nvarchar](255) NULL,
	[Observações 1º Tri 2020] [nvarchar](255) NULL,
	[Data de início da análise 1º Tri 2020] [datetime] NULL,
	[Data da última análise 1º Tri 2020] [datetime] NULL,
	[Responsável análise 1º Tri 2020] [nvarchar](255) NULL,
	[Saldo a provisionar] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].['Gerencial - Domiciliar$']    Script Date: 23/03/2020 13:50:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].['Gerencial - Domiciliar$'](
	[AGRUPAMENTO_ITEM] [nvarchar](255) NULL,
	[CC_COD_CLIENTE] [nvarchar](255) NULL,
	[CC_COD_ENDERECO] [nvarchar](255) NULL,
	[COD_CLIE_COD_END] [nvarchar](255) NULL,
	[COD_CLIE_COD_END_DESCR_ITEM] [nvarchar](255) NULL,
	[CC_FILIAL] [nvarchar](255) NULL,
	[FILTRO_CNPJ] [nvarchar](255) NULL,
	[CC_RAZAO_SOCIAL] [nvarchar](255) NULL,
	[DESCRICAO_ITEM_RESUMIDA] [nvarchar](255) NULL,
	[TIPO_VASILHAME] [nvarchar](255) NULL,
	[CC_QTDE] [float] NULL,
	[GED_QTDE_TOTAL] [float] NULL,
	[GED_QTD_ITEM_DIG] [float] NULL,
	[ERP_NF_QTDE_ITEM] [float] NULL,
	[STATUS_DETALHADO_DOMICILIAR] [nvarchar](255) NULL,
	[STATUS_FINAL_DOMICILIAR] [nvarchar](255) NULL,
	[CONTADOR_CLIENTE] [float] NULL,
	[FILTRO_CC_S_N] [nvarchar](255) NULL,
	[IDADE_CLIENTE] [nvarchar](255) NULL,
	[CON_DT_PRIM_EMISSAO] [datetime] NULL,
	[FILTRO_CONSOME_S_N] [nvarchar](255) NULL,
	[CONFERENCIA_CC_X_CONTRATOS] [nvarchar](255) NULL,
	[CONFERENCIA_CC_X_NF_DIG] [nvarchar](255) NULL,
	[FILTRO_PREVENTIVA_S_N] [nvarchar](255) NULL,
	[PLAN_DISTANCIA] [nvarchar](255) NULL,
	[PLAN_FAIXA_DISTANCIA] [nvarchar](255) NULL
) ON [PRIMARY]
GO
