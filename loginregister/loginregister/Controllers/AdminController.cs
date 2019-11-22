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
    public class AdminController : ControllerBase
    {
        mentorContext con = new mentorContext();
        // GET: api/Admin
       
        [HttpGet]
        [Route("Getskills")]
        public IEnumerable<Skills> Getskills()
        {
            try
            { 
            return con.Skills.ToList();
        }
             catch (Exception e)
            {
                return null;
            }
}

        // GET: api/Admin/5
        [HttpGet("{id}", Name = "Geta")]
        public string Get(int id)
        {
            return "value";
        }

        // POST: api/Admin
        [HttpPost]
        public void Post([FromBody] string value)
        {
        }

        // PUT: api/Admin/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] Skills val)
        {
            con.Skills.Add(val);
        }

        // DELETE: api/ApiWithActions/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
