using System;
using System.Collections.Generic;

namespace loginregister.Models
{
    public partial class Training
    {
        public int TrId { get; set; }
        public int? TrUid { get; set; }
        public int? TrMid { get; set; }
        public int? TrSid { get; set; }
        public string TrStatus { get; set; }

        public Mentordtls TrM { get; set; }
        public Skills TrS { get; set; }
        public Userdtls TrU { get; set; }
    }
}
