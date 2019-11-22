using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace mentornuser.Models
{
    public class acceptuser
    {[Key]
       public int acsId { get; set; }
        public string acUsername { get; set; }
        public decimal acContactnumber { get; set; }
        public string acSkName { get; set; }
    }
}
