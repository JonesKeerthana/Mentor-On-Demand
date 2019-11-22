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
    public class userController : ControllerBase
    {
        mentorContext con = new mentorContext();

 
        // GET: api/user
        [HttpGet]
        [Route("dispmentor")]
        public IEnumerable<dispuserpage> dispmentor()
        {
            try { 
            return con.dispuserpage.FromSql("spuser").ToList();
        }
             catch (Exception e)
            {
                return null;
            }
}
        
        [HttpGet]
        [Route("disptraining")]
        public IEnumerable<Training> disptraining()
        {
            try { 
            return con.Training.ToList();
        }
             catch (Exception e)
            {
                return null;
            }
}
        // GET: api/user/5
      
        [HttpGet]
        [Route("search/{id}")]
        public IEnumerable<dispuserpage> search(int id)
        {
            try { 
            return con.dispuserpage.FromSql("spsearch '" + id + "'").ToList();
        }
             catch (Exception e)
            {
                return null;
            }
}
      


       
        // POST: api/user
        [HttpPost]
        [Route("bookslot/{uid}/{mid}/{sid}")]
        public void Post(int uid,int mid,int sid)
        {
            try { 
            this.con.Database.ExecuteSqlCommand("spchoosementor "+uid+ "," + mid + ","  + sid);
        }
             catch (Exception e)
            {
               
            }
}

        // PUT: api/user/5
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
