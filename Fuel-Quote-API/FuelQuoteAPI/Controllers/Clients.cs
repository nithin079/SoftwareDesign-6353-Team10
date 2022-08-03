using CustomerAPI.Constants;
using Microsoft.AspNetCore.Mvc;
using Repository.Abstract;
using Repository.Model;
using System.Net;
using BC = BCrypt.Net.BCrypt;

namespace CustomerAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class Clients : ControllerBase
    {
        private readonly IClientMaster _clientMaster;

        public Clients(IClientMaster clientMaster)
        {
            _clientMaster = clientMaster;
        }

        [HttpPost("register")]
        public Response Register([FromBody] ClientMasterModel customerMaster)
        {
            var checkUserExists = _clientMaster.GetUserByUsername(customerMaster.UserName);
            if (checkUserExists == null)
            {
                customerMaster.PasswordHash= BC.HashPassword(customerMaster.PasswordHash);
                var result = _clientMaster.Register(customerMaster);
                Response response = new Response(HttpStatusCode.OK, result, AppConstant.Success);
                return response;
            }
            else
            {
                Response response = new Response(HttpStatusCode.Conflict, "Client Already Exists", AppConstant.Success);
                return response;
            }
        }

        [HttpPost("authenticate")]
        public Response authenticate([FromBody] LoginRequestModel loginRequestModel)
        {
            var checkUserExists = _clientMaster.LoginCheck(loginRequestModel);
            if (checkUserExists != null && BC.Verify(loginRequestModel.PasswordHash, checkUserExists.PasswordHash))
            {
                checkUserExists.PasswordHash = string.Empty;
                Response response = new Response(HttpStatusCode.OK, checkUserExists, AppConstant.Success);
                return response;
            }
            else
            {
                Response response = new Response(HttpStatusCode.NotFound, "Invalid Username or Password", AppConstant.Success);
                return response;
            }
        }

        [HttpPost("update")]
        public Response Update([FromBody] ClientMasterModel customerMaster)
        {
            var result = _clientMaster.Update(customerMaster);
            Response response = new Response(HttpStatusCode.OK, result, AppConstant.Success);
            return response;
        }

       
    }
}