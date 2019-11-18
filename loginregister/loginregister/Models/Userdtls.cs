using System;
using System.Collections.Generic;

namespace loginregister.Models
{
    public partial class Userdtls
    {
        public Userdtls()
        {
            Training = new HashSet<Training>();
        }

        public int Id { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public string Firstname { get; set; }
        public string Lastname { get; set; }
        public decimal Contactnumber { get; set; }
        public string Regcode { get; set; }
        public string Active { get; set; }
        public string Resetpassword { get; set; }
        public DateTime Regdatetime { get; set; }

        public ICollection<Training> Training { get; set; }
    }
}
