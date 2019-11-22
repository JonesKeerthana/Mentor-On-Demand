using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using mentornuser.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace mentornuser.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class mentorController : ControllerBase
    {
        mentorContext con = new mentorContext();
        

        [HttpGet]
        [Route("Getmentorskills")]
        public IEnumerable<Mentorskills> Getmentorskills()
        {
            try { 
            return con.Mentorskills.ToList();
        }
             catch (Exception e)
            {
                return null;
            }
}
       
        [HttpGet]
        [Route("acceptusers/{id}")]
        public IEnumerable<acceptuser> acceptusers(int id)
        {
            try { 
            return con.acceptuser.FromSql("spaccept'"+id+"'").ToList();
            }
            catch (Exception e)
            {
                return null;
            }
        }

       
        [HttpGet]
        [Route("GetMentorTech/{id}")]
        public IEnumerable<Mentortechlist> GetMentorTech(int id)
        {
            try { 
            return con.Mentortechlist.FromSql("spmentorlist '" + id + "'").ToList();
            }
            catch (Exception e)
            {
                return null;
            }
        }
     

        // POST: api/mentor
       
        [HttpPost]
        [Route("AddSkill/{mid}")]
        public void Postskills(int mid,int sid,[FromBody] Mentorskills value)
        {
            try { 
            this.con.Database.ExecuteSqlCommand("speaddskill '"+mid+"','"+value.MsSid+"','"+value.MsSelfrating+ "','" + value.MsYearsofexperience + "' ");
        }
             catch (Exception e)
            {
              
            }
}
       
        // PUT: api/mentor/5
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
