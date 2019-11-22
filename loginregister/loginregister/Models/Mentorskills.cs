using System;
using System.Collections.Generic;

namespace loginregister.Models
{
    public partial class Mentorskills
    {
        public int MsId { get; set; }
        public int? MsMid { get; set; }
        public int? MsSid { get; set; }
        public decimal? MsSelfrating { get; set; }
        public int? MsYearsofexperience { get; set; }
        public int? MsTrainingdelivered { get; set; }
        public string MsFacilitiesoffered { get; set; }

        public Mentordtls MsM { get; set; }
        public Skills MsS { get; set; }
    }
}
