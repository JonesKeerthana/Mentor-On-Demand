﻿using System;
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
    public class userController : ControllerBase
    {
        mentorContext con = new mentorContext();
        // GET: api/user
        [HttpGet]
        public IEnumerable<Search> Get()
        {
            return con.Search.ToList();
        }

        // GET: api/user/5
        [HttpGet("{id}", Name = "Get")]
        public string Get(int id)
        {
            return "value";
        }

        // POST: api/user
        [HttpPost]
        public void Post([FromBody] string value)
        {
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
