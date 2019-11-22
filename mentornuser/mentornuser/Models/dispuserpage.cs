using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace mentornuser.Models
{
    public class dispuserpage
    {[Key]
        public int DMsId { get; set; }
        public int  DMId { get; set; }
        public int DSkId { get; set; }
        public string DMName { get; set; }
        public string DMLinkedinurl { get; set; }
        public string DSkName { get; set; }
        public int? DMsYearsofexperience { get; set; }
        public decimal? DMsSelfrating { get; set; }
       
    }
}
