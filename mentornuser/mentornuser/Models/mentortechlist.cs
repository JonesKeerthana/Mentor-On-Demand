using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace mentornuser.Models
{
    public class Mentortechlist
    {
    [Key]

        public string SkillName { get; set; }
        public decimal? MskillSelfrating { get; set; }
        public int? MskillYearsofexperience { get; set; }
        public int? MskillTrainingdelivered { get; set; }
        public string MskillFacilitiesoffered { get; set; }
      
    }
  
}
