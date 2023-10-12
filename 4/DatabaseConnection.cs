using System;
using System.Data;
using System.Data.SqlClient;

public class DatabaseConnection
{
    private string connectionString;

    public DatabaseConnection(string connectionString)
    {
        this.connectionString = connectionString;
    }

    public DataSet ExecuteSelect(string query)
    {
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            SqlDataAdapter adapter = new SqlDataAdapter();
            adapter.SelectCommand = new SqlCommand(query, connection);
            DataSet dataSet = new DataSet();
            adapter.Fill(dataSet);
            return dataSet;
        }
    }

    public int ExecuteInsertUpdateDelete(string query)
    {
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            SqlCommand command = new SqlCommand(query, connection);
            connection.Open();
            int affectedRows = command.ExecuteNonQuery();
            return affectedRows;
        }
    }

    public int GetSelectRowCount(string query)
    {
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            SqlCommand command = new SqlCommand(query, connection);
            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            DataTable dataTable = new DataTable();
            dataTable.Load(reader);
            return dataTable.Rows.Count;
        }
    }
}