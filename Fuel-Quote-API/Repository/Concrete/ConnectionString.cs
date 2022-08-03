namespace Repository.Concrete
{
    public static class ConnectionString
    {
       public static string GetConnectionString()
        {
            string ConnectionString= @"Server=USRONNNERELLA01\SQLSERVER;Database=FuelQuote;Trusted_Connection=True;Integrated Security=False;User ID=sa; password=Summer@11281996";
            return ConnectionString;
        }
    }
}
