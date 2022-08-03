using CustomerAPI.Constants;
using Microsoft.AspNetCore.Mvc;
using Repository.Abstract;
using Repository.Model;
using System.Net;

namespace CustomerAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class FuelQuote : ControllerBase
    {
        private readonly IFuelQuoteMaster _fuelQuoteMaster;

        public FuelQuote(IFuelQuoteMaster fuelQuoteMaster)
        {
            _fuelQuoteMaster = fuelQuoteMaster;
        }

        [HttpPost("add")]
        public Response Add([FromBody] FuelQuoteMasterModel customerMaster)
        {
            var result = _fuelQuoteMaster.Add(customerMaster);
            Response response = new Response(HttpStatusCode.OK, result, AppConstant.Success);
            return response;
        }

        [HttpPost("getHistory")]
        public Response GetHistory([FromBody] FuelHistoryRequestModel fuelHistoryRequestModel)
        {
            var result = _fuelQuoteMaster.GetFuelHistyory(fuelHistoryRequestModel);
            Response response = new Response(HttpStatusCode.OK, result, AppConstant.Success);
            return response;
        }
    }
}