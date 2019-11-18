using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using mentornuser.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace mentornuser.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class mentorController : ControllerBase
    {
        mentorContext con = new mentorContext();
        // GET: api/mentor
        [HttpGet]
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET: api/mentor/5
        [HttpGet("{id}", Name = "Get")]
        public string Get(int id)
        {
            return "value";
        }

        // POST: api/mentor
        [HttpPost]
        public void Post([FromBody] string value)
        {
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
