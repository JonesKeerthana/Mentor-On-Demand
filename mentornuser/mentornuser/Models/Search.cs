using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace mentornuser.Models
{
    public class Search
    {
        [Key]
        public int MId { get; set; }
        public string MName { get; set; }
        public string SkName { get; set; }
        public decimal? MsSelfrating { get; set; }
        public int? MsYearsofexperience { get; set; }

    }
}
