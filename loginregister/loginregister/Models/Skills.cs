using System;
using System.Collections.Generic;

namespace loginregister.Models
{
    public partial class Skills
    {
        public Skills()
        {
            Mentorskills = new HashSet<Mentorskills>();
            Training = new HashSet<Training>();
        }

        public int SkId { get; set; }
        public string SkName { get; set; }
        public string SkToc { get; set; }
        public int SkDuration { get; set; }
        public string SkPrerequistes { get; set; }

        public ICollection<Mentorskills> Mentorskills { get; set; }
        public ICollection<Training> Training { get; set; }
    }
}
