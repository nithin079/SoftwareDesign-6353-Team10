using Repository.Model;
using System.Collections.Generic;

namespace Repository.Abstract
{
    public interface IFuelQuoteMaster
    {
        FuelQuoteMasterModel Add(FuelQuoteMasterModel fuelQuoteMaster);
        IEnumerable<FuelQuoteMasterModel> GetFuelHistyory(FuelHistoryRequestModel fuelHistoryRequestModel);
    }
}