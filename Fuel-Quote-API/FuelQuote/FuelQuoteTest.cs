using CustomerAPI.Controllers;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Repository.Abstract;
using Repository.Concrete;
using Repository.Model;
using System;
using Xunit;

namespace FuelQuoteTest
{
    public class FuelQuoteTest
    {
        IFuelQuoteMaster _fuelQuoteMaster;
        FuelQuote _fuelQuoteController;
        public IConfiguration _configuration { get; }
        public object AdditionalServices { get; private set; }

        public FuelQuoteTest()
        {
            _fuelQuoteMaster = new FuelQuoteMaster(_configuration);
            _fuelQuoteController = new FuelQuote(_fuelQuoteMaster);

        }

        [Fact]

        public void Add()
        {
            //Arrange
            var adddetails = new FuelQuoteMasterModel()
            {
                ClientId = 1,
                GallonsRequested = 3,
                DeliveryDate = System.DateTime.Today,
                SuggestedPrice = 1.670,
                TotalAmountDue = 5.010,
                DiliveryAddress = "2250 Texas",

            };

            //Act
            var createdResponse = _fuelQuoteController.Add(adddetails);
            Assert.NotNull(createdResponse);
            Assert.True(createdResponse.Message.Equals("success"));

        }

        [Fact]
        public void GetHistory()
        {
            //Arrange
            var getdetails = new FuelHistoryRequestModel()
            {
                ClientId = 1,
                RoleId = 1,

            };

            //Act
            var createdResponse = _fuelQuoteController.GetHistory(getdetails);
            Assert.NotNull(createdResponse);
            Assert.True(createdResponse.Message.Equals("success"));

        }

              
       

       
    }
}

