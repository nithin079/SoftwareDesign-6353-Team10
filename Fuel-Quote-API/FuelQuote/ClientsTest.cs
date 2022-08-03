using CustomerAPI.Controllers;
using Microsoft.Extensions.Configuration;
using Repository.Abstract;
using Repository.Concrete;
using Repository.Model;
using Xunit;

namespace FuelQuoteTest
{
    public class ClientsTest
    {
        IClientMaster _clientMaster;
        Clients _clientController;
        public IConfiguration _configuration { get; }


        public ClientsTest()
        {
            _clientMaster = new ClientMaster();
            _clientController = new Clients(_clientMaster);
          
        }


        [Fact]
        public void Register()
        {
            //Arrange
            var registerdetails = new ClientMasterModel()
            {
                UserName = "shiv3",
                PasswordHash = "123",
            };

            //Act
            var createdResponse = _clientController.Register(registerdetails);
            Assert.NotNull(createdResponse);

        }
        
        [Fact]
        public void ClientAlreadyExists()
        {
            //Arrange
            var registerdetails = new ClientMasterModel()
            {
                UserName = "shiv",
                PasswordHash = "123",
            };

            //Act
            var createdResponse = _clientController.Register(registerdetails);
            Assert.NotNull(createdResponse);
            Assert.True(createdResponse.Result.Equals("Client Already Exists"));

        }

        [Fact]
        public void Login()
        {
            //Arrange
            var login = new LoginRequestModel()
            {
                UserName = "shiv",
                PasswordHash = "1444",
            };

            //Act
            var createdResponse = _clientController.authenticate(login);
            Assert.NotNull(createdResponse);
            Assert.True(createdResponse.Result.Equals("Invalid Username or Password"));

        }

        [Fact]
        public void LoginSuccess()
        {
            //Arrange
            var login = new LoginRequestModel()
            {
                UserName = "shiv",
                PasswordHash = "123",
            };

            //Act
            var createdResponse = _clientController.authenticate(login);
            Assert.NotNull(createdResponse);
            Assert.True(createdResponse.Message.Equals("success"));

        }

        [Fact]
        public void Update()
        {
            //Arrange
            var update = new ClientMasterModel()
            {
                Id = 2,
                FullName = "Shiv Shankar",
                Address1 = "8383 sebastian st",
                City = "Hyderabad",
                State = "Telangana",
                
            };

            //Act
            var createdResponse = _clientController.Update(update);
            Assert.NotNull(createdResponse);
            Assert.True(createdResponse.Message.Equals("success"));

        }


    }
}
