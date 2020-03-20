using ExcelDataReader;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;


namespace ConsoleApp2
{

    class Program
    {
        private static DataSet baseOracle = new DataSet();
        private static DataSet baseOperacao = new DataSet();
        private static DataTable baseTratada = new DataTable();

        static void Main(string[] args)
        {
            using (var stream = File.Open(@"C:\Solution\Sanofisolution\basededados\Test2.basededados.xlsx", FileMode.Open, FileAccess.Read))
            {

                // Detecta automaticamente o formato, suporta:
                // - arquivos binários do Excel (formato 2.0-2003; * .xls)
                // - arquivos do Excel OpenXml (formato 2007; * .xlsx)
                using (var reader = ExcelReaderFactory.CreateReader(stream))
                {

                    // 1. Use os métodos do leitor,DataTable 
                    do
                    {
                        while (reader.Read())
                        {
                            // reader.GetDouble(0);
                        }
                    } while (reader.NextResult());

                    // 2. Use o método de extensão AsDataSet
                    var headers = new List<string>();


                    //dataset do excel
                    baseOracle = reader.AsDataSet(new ExcelDataSetConfiguration()
                    {
                        ConfigureDataTable = (tableReader) => new ExcelDataTableConfiguration()
                        {
                            UseHeaderRow = true,
                                
                            ReadHeaderRow = rowReader =>
                            {
                                for (var i = 0; i < rowReader.FieldCount; i++)
                                    headers.Add(Convert.ToString(rowReader.GetValue(i)));
                            },

                            FilterColumn = (columnReader, columnIndex) =>
                                headers.IndexOf("string") != columnIndex

                        }
                    });// O resultado de cada planilha está no resultado.
                }
            }
            using (var stream = File.Open(@"C:\Solution\Sanofisolution\Saneamento domiciliar\Saneamento Domiciliar.xlsx", FileMode.Open, FileAccess.Read))
            {

                // Detecta automaticamente o formato, suporta:
                // - arquivos binários do Excel (formato 2.0-2003; * .xls)
                // - arquivos do Excel OpenXml (formato 2007; * .xlsx)
                using (var reader = ExcelReaderFactory.CreateReader(stream))
                {

                    // 1. Use os métodos do leitor,DataTable 
                    do
                    {
                        while (reader.Read())
                        {
                            // reader.GetDouble(0);
                        }
                    } while (reader.NextResult());

                    // 2. Use o método de extensão AsDataSet
                    var headers = new List<string>();


                    //dataset do excel
                    baseOperacao = reader.AsDataSet(new ExcelDataSetConfiguration()
                    {
                        ConfigureDataTable = (tableReader) => new ExcelDataTableConfiguration()
                        {
                            UseHeaderRow = true,

                            ReadHeaderRow = rowReader =>
                            {
                                for (var i = 0; i < rowReader.FieldCount; i++)
                                    headers.Add(Convert.ToString(rowReader.GetValue(i)));
                            },

                            FilterColumn = (columnReader, columnIndex) =>
                                headers.IndexOf("string") != columnIndex

                        }
                    });// O resultado de cada planilha está no resultado.
                }
            }

            //Criar novas colunas do execel 
            baseTratada.Columns.Add("CC_COD_CLIENTE", typeof(String));
            baseTratada.Columns.Add("CC_COD_ENDERECO", typeof(String));
            baseTratada.Columns.Add("COD_CLIE_COD_END", typeof(String));
            baseTratada.Columns.Add("COD_CLIE_COD_END_DESCR_ITEM", typeof(String));
            baseTratada.Columns.Add("FILTRO_CNPJ", typeof(String));
            baseTratada.Columns.Add("CC_RAZAO_SOCIAL", typeof(String));
            baseTratada.Columns.Add("DESCRICAO_ITEM_RESUMIDA", typeof(String));
            baseTratada.Columns.Add("TIPO_VASILHAME", typeof(String));
            baseTratada.Columns.Add("CCFILIAL", typeof(String));
            baseTratada.Columns.Add("CC_QTDE", typeof(String));
            baseTratada.Columns.Add("CON_DT_PRIM_EMISSAO", typeof(DateTime));


        }
    }
}       