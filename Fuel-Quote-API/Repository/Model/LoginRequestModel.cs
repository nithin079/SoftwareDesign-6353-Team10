namespace Repository.Model
{
    public class LoginRequestModel
    {
        public string UserName { get; set; }
        public string PasswordHash { get; set; }
    }
}