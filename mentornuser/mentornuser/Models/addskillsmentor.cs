using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace mentornuser.Models
{
    public class addskillsmentor
    {[Key]
        public int? AMsMid { get; set; }
        public string AMsName { get; set; }
        public decimal? AMsSelfrating { get; set; }
        public int? AMsYearsofexperience { get; set; }
        public int? AMsTrainingdelivered { get; set; }
        public string AMsFacilitiesoffered { get; set; }
    }
}
