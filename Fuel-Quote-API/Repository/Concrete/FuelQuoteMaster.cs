using Dapper;
using Microsoft.Extensions.Configuration;
using Repository.Abstract;
using Repository.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;

namespace Repository.Concrete
{
    public class FuelQuoteMaster : IFuelQuoteMaster
    {
        public IConfiguration _configuration { get; }

        public FuelQuoteMaster(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        public FuelQuoteMasterModel Add(FuelQuoteMasterModel fuelQuoteMaster)
        {
            string connectionString = ConnectionString.GetConnectionString();
            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    DynamicParameters parameters = new DynamicParameters();
                    parameters.Add("@ClientId", fuelQuoteMaster.ClientId);
                    parameters.Add("@GallonsRequested", fuelQuoteMaster.GallonsRequested);
                    parameters.Add("@DeliveryDate", fuelQuoteMaster.DeliveryDate);
                    parameters.Add("@SuggestedPrice", fuelQuoteMaster.SuggestedPrice);
                    parameters.Add("@TotalAmountDue", fuelQuoteMaster.TotalAmountDue);
                    parameters.Add("@DiliveryAddress", fuelQuoteMaster.DiliveryAddress);
                    var fuelQuote = SqlMapper.Query<FuelQuoteMasterModel>(con, "usp_FuelQuoteMasterInsert", param: parameters, commandType: CommandType.StoredProcedure).FirstOrDefault();
                    return fuelQuote;
                }
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public IEnumerable<FuelQuoteMasterModel> GetFuelHistyory(FuelHistoryRequestModel fuelHistoryRequestModel)
        {
            string connectionString = ConnectionString.GetConnectionString();
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                DynamicParameters parameters = new DynamicParameters();
                parameters.Add("@ClientId", fuelHistoryRequestModel.ClientId);
                parameters.Add("@RoleId", fuelHistoryRequestModel.RoleId);
                var result = SqlMapper.Query<FuelQuoteMasterModel>(con, "spGetFuelHistory", param: parameters, commandType: CommandType.StoredProcedure).ToList();
                con.Close();
                return result;
            }
        }
    }
}