using Repository.Model;
using System.Collections.Generic;

namespace Repository.Abstract
{
    public interface IClientMaster
    {
       

      

        ClientMasterModel Update(ClientMasterModel customerMaster);

        ClientMasterModel Register(ClientMasterModel customerMaster);

        ClientMasterModel GetUserByUsername(string userName);

     

        ClientMasterModel LoginCheck(LoginRequestModel loginRequestModel);
    }
}