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
    public class ClientMaster : IClientMaster
    {
        public IConfiguration _configuration { get; }

        public ClientMaster()
        {
        }

        public ClientMasterModel Update(ClientMasterModel customerMaster)
        {
            string connectionString = ConnectionString.GetConnectionString();
            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    DynamicParameters parameters = new DynamicParameters();
                    parameters.Add("@ID", customerMaster.Id);
                    parameters.Add("@UserName", customerMaster.UserName);
                    parameters.Add("@FullName", customerMaster.FullName);
                    parameters.Add("@Address1", customerMaster.Address1);
                    parameters.Add("@Address2", customerMaster.Address2);
                    parameters.Add("@City", customerMaster.City);
                    parameters.Add("@State", customerMaster.State);
                    parameters.Add("@Zipcode", customerMaster.Zipcode);
                    var UserData = SqlMapper.Query<ClientMasterModel>(con, "Client_ups", param: parameters, commandType: CommandType.StoredProcedure).FirstOrDefault();
                    return UserData;
                }
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public ClientMasterModel GetUserByUsername(string userName)
        {
            string connectionString = ConnectionString.GetConnectionString();
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                DynamicParameters parameters = new DynamicParameters();
                parameters.Add("@UserName", userName);

                var result = SqlMapper.Query<ClientMasterModel>(con, "spCheckUserName", param: parameters, commandType: CommandType.StoredProcedure).FirstOrDefault();
                con.Close();
                return result;
            }
        }

        public ClientMasterModel LoginCheck(LoginRequestModel loginRequestModel)
        {
            string connectionString = ConnectionString.GetConnectionString();
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                DynamicParameters parameters = new DynamicParameters();
                parameters.Add("@UserName", loginRequestModel.UserName);
                parameters.Add("@PasswordHash", loginRequestModel.PasswordHash);

                var result = SqlMapper.Query<ClientMasterModel>(con, "spLoginCheck", param: parameters, commandType: CommandType.StoredProcedure).FirstOrDefault();
                con.Close();
                return result;
            }
        }

     

        public ClientMasterModel Register(ClientMasterModel customerMaster)
        {
            string connectionString = ConnectionString.GetConnectionString();
            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    DynamicParameters parameters = new DynamicParameters();
                    parameters.Add("@UserName", customerMaster.UserName);
                    parameters.Add("@PasswordHash", customerMaster.PasswordHash);
                    var UserData = SqlMapper.Query<ClientMasterModel>(con, "Client_Register", param: parameters, commandType: CommandType.StoredProcedure).FirstOrDefault();
                    return UserData;
                }
            }
            catch (Exception ex)
            {
                return null;
            }
        }
    }
}