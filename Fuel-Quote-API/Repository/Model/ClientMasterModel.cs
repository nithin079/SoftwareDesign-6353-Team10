using System;

namespace Repository.Model
{
    public class ClientMasterModel
    {
        public int Id { get; set; }

        public string UserName { get; set; }

        public string FullName { get; set; }

        public string Address1 { get; set; }

        public string Address2 { get; set; }

        public string City { get; set; }

        public string State { get; set; }

        public string Zipcode { get; set; }

        public string PasswordHash { get; set; }

        public Role Role { get; set; }

        public DateTime Created { get; set; }

        public DateTime? Updated { get; set; }
    }
}