using ClosedXML.Excel;
using DocumentFormat.OpenXml.Spreadsheet;
using ExcelDataReader;
using OpenQA.Selenium.PhantomJS;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing.Imaging;
using System.IO;
using System.Text;

namespace ConsoleApp2
{

    class Program
    {
        private static DataSet baseBI = new DataSet();
        private static DataSet baseOperacao = new DataSet();
        private static DataSet baseTratada = new DataSet();

        static void Main(string[] args)
        {

          

            try
                {
                string Connections = @"Server=(localdb)\MSSQLLocalDB;Database=dbUltra;Trusted_Connection=True";

                //Primeiro ponto: Acessa o sistema e  baixar o execel fazer isso atraves do PhamtonJS
                ///////////////////
                ///////////////////
                /////////////////
                /////////////////////
                //////////////////




                //Passo 2 : ler o novo excel
                //Atualizar a base de dados 

                using (var stream = File.Open(@"C:\SolutionUltra\dbBasededados.xls", FileMode.Open, FileAccess.Read))
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

                        // 2. Use o método de extensão AsDataSetx
                        var headers = new List<string>();


                        //dataset do excel
                        baseBI = reader.AsDataSet(new ExcelDataSetConfiguration()
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
                using (SqlBulkCopy bulkCopy = new SqlBulkCopy(Connections))
                {
                    //Atualizar o BI
                    bulkCopy.DestinationTableName =
                        "[dbo].['Gerencial - Domiciliar$']";

                    try
                    {
                        // Write from the source to the destination.
                        bulkCopy.WriteToServer(baseBI.Tables[0]);
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine(ex.Message);
                    }
                }
                // Fimm de o arquivo


                //Atualizar o trimestre anterior
                using (SqlConnection connections = new SqlConnection(Connections))
                {

                    StringBuilder sb = new StringBuilder();
                    sb.Append(" select   ");    
                    sb.Append(" TrimestreAnterior.CC_COD_CLIENTE as 'TrimestreAnterior', ");
                    sb.Append(" BI.CC_COD_CLIENTE as 'BI', ");
                    sb.Append(" TrimestreAnterior.CC_RAZAO_SOCIAL, ");
                    sb.Append(" TrimestreAnterior.CCFILIAL, ");
                    sb.Append(" TrimestreAnterior.DESCRICAO_ITEM_RESUMIDA, ");
                    sb.Append(" TrimestreAnterior.CC_QTDE as 'TrimestreAnterior', ");
                    sb.Append(" BI.CC_QTDE as 'BI',");
                    // faz a conta =-20
                    sb.Append(" ((TrimestreAnterior.CC_QTDE * 1)+( BI.CC_QTDE * 1)) as 'comparacao'  ");
                    sb.Append(" from [dbUltra].[dbo].['Gerencial - Domiciliar$'] as BI ");
                    sb.Append("  inner join [dbUltra].[dbo].Detalhamento$ as TrimestreAnterior ");
                    sb.Append("  on ");
                    sb.Append(" BI.CC_COD_CLIENTE = TrimestreAnterior.CC_COD_CLIENTE AND ");
                    sb.Append(" BI.CC_COD_ENDERECO = TrimestreAnterior.CC_COD_ENDERECO AND ");
                   sb.Append("  BI.DESCRICAO_ITEM_RESUMIDA = TrimestreAnterior.DESCRICAO_ITEM_RESUMIDA ");



                    String sql = sb.ToString();

                    using (SqlCommand command = new SqlCommand(sql, connections))
                    {
                        command.CommandTimeout = TimeSpan.FromMinutes(60).Seconds;
                        connections.Open();
                        
                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                Console.WriteLine("{0} {1}", reader.GetString(0), reader.GetString(1));
                            }
                        }
                        SqlDataAdapter theDataAdapter = new SqlDataAdapter(command);
                        theDataAdapter.Fill(baseTratada);
                    }
                    using (SqlBulkCopy bulkCopy = new SqlBulkCopy(Connections))
                    {
                        //Atualizar o BI
                        bulkCopy.DestinationTableName =
                            "[dbo].Detalhamento$";

                        try
                        {
                            // Write from the source to the destination.
                            bulkCopy.WriteToServer(baseTratada.Tables[0]); ;
                        }
                        catch (Exception ex)
                        {
                            Console.WriteLine(ex.Message);
                        }
                    }
                }

            }
            catch (Exception e )
            {

            }

            //exportar o excel
            string nomeArquivo = "teste";
            ExportDataSetToExcel(baseTratada,nomeArquivo);


        }
        public static void ExportDataSetToExcel(DataSet ds,string nome)
        {
            string AppLocation = "";
            AppLocation = System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().CodeBase);
            AppLocation = AppLocation.Replace("file:\\", "");
            string date = DateTime.Now.ToShortDateString();
            date = date.Replace("/", "_");
            string filepath = @"C:\\novodireito\" + nome + ".xlsx";

            using (XLWorkbook wb = new XLWorkbook())
            {
                for (int i = 0; i < ds.Tables.Count; i++)
                {
                    wb.Worksheets.Add(ds.Tables[i], ds.Tables[i].TableName);
                }
                wb.Style.Alignment.Horizontal = XLAlignmentHorizontalValues.Center;
                wb.Style.Font.Bold = true;
                wb.SaveAs(filepath);
            }
        }
    }
}
