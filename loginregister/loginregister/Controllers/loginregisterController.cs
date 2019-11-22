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
     
        [HttpGet]
        [Route("GetAdmin/{uname}/{pass}")]
        public Admin GetAdmin(string uname, string pass)
        {
            try
            {
                return con.Admin.FromSql("sploginadmin '" + uname + "','" + pass + "' ").SingleOrDefault();
            }
           catch(Exception e)
            {
                return null;
            }
        }

       
        [HttpGet]
        [Route("GetMentor/{uname}/{pass}")]
        public Mentordtls GetMentor(string uname, string pass)
        {
            try { 
            return con.Mentordtls.FromSql("sploginmentor '" + uname + "','" + pass + "' ").SingleOrDefault();
        }
             catch (Exception e)
            {
                return null;
            }
        }

       
        [HttpGet]
        [Route("GetUser/{uname}/{pass}")]
        public Userdtls GetUser(string uname, string pass)
        {
            try { 
            return con.Userdtls.FromSql("sploginuser '" + uname + "','" + pass + "' ").SingleOrDefault();
                }
             catch (Exception e)
            {
                return null;
            }
}
        // GET: api/loginregister/5
        [HttpGet("{id}", Name = "Get")]
        public string Get(int id)
        {
            
            return "value";
        
}

       
        [HttpPost]
        [Route("PostMentor")]
        public void PostMentor([FromBody] Mentordtls mn)
        {
            try { 
            con.Database.ExecuteSqlCommand("spregistermentor '" + mn.MName + "','" + mn.MUsername + "','" + mn.MPassword + "','" + mn.MLinkedinurl + "','" + mn.MYearsofexperience + "'");
                }
             catch (Exception e)
            {
                
            }
}

       
        [HttpPost]
        [Route("PostUser")]
        public void PostUser([FromBody] Userdtls us)
        {
            try { 
            con.Database.ExecuteSqlCommand("spregisteruser '" + us.Username + "','" + us.Password + "','" + us.Firstname + "','" + us.Lastname + "','" + us.Contactnumber + "'");
        }
             catch (Exception e)
            {
                
            }
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
