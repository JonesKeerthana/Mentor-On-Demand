using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using loginregister.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace loginregister.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class loginregisterController : ControllerBase
    {
        mentorContext con = new mentorContext();
        // GET: api/loginregister

        [Route("GetAdmin/{uname}/{pass}")]

        [HttpGet(Name = "GetAdmin")]
        public Admin GetAdmin(string uname, string pass)
        {
            return con.Admin.FromSql("sploginadmin '" + uname + "','" + pass + "' ").SingleOrDefault();
        }

        [Route("GetMentor/{uname}/{pass}")]
        [HttpGet(Name = "GetMentor")]
        public Mentordtls GetMentor(string uname, string pass)
        {
            return con.Mentordtls.FromSql("sploginmentor '" + uname + "','" + pass + "' ").SingleOrDefault();
        }

        [Route("GetUser/{uname}/{pass}")]
        [HttpGet(Name = "GetUser")]
        public Userdtls GetUser(string uname, string pass)
        {
            return con.Userdtls.FromSql("sploginuser '" + uname + "','" + pass + "' ").SingleOrDefault();
        }
        // GET: api/loginregister/5
        [HttpGet("{id}", Name = "Get")]
        public string Get(int id)
        {
            return "value";
        }

        [Route("PostMentor")]
        [HttpPost]
        public void PostMentor([FromBody] Mentordtls mn)
        {
            con.Database.ExecuteSqlCommand("spregistermentor '" + mn.MName + "','" + mn.MUsername + "','" + mn.MPassword + "','" + mn.MLinkedinurl + "','" + mn.MYearsofexperience + "'");
        }

        [Route("PostUser")]
        [HttpPost]
        public void PostUser([FromBody] Userdtls us)
        {
            con.Database.ExecuteSqlCommand("spregisteruser '" + us.Username + "','" + us.Password + "','" + us.Firstname + "','" + us.Lastname + "','" + us.Contactnumber + "'");
        }

        // PUT: api/loginregister/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE: api/ApiWithActions/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
