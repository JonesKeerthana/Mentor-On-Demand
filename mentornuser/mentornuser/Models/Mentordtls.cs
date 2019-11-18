using System;
using System.Collections.Generic;

namespace mentornuser.Models
{
    public partial class Mentordtls
    {
        public Mentordtls()
        {
            Training = new HashSet<Training>();
        }

        public int MId { get; set; }
        public string MUsername { get; set; }
        public string MPassword { get; set; }
        public string MLinkedinurl { get; set; }
        public DateTime MRegdattime { get; set; }
        public string MRegcode { get; set; }
        public int? MYearsofexperience { get; set; }
        public string MActive { get; set; }

        public ICollection<Training> Training { get; set; }
    }
}
