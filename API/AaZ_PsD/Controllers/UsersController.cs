﻿using AaZ_PsD.Model;
using AaZ_PsD.Repository;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Linq;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace AaZ_PsD.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UsersController : ControllerBase
    {
        private readonly RoleRepository _roleRepository;
        private readonly UsersRepository _usersRepository;
        public UsersController(RoleRepository roleRepository, UsersRepository usersRepository)
        {
            _roleRepository = roleRepository;
            _usersRepository = usersRepository;
        }

        [Route("/GetRoles")]
        [HttpGet]
        [Authorize]
        public List<Role> GetRoles()
        {
            return _roleRepository.getAllRoles();
        }

        // GET: api/<UsersController>
        [HttpGet]
        [Authorize]
        public List<UserModel> Get()
        {
            return _usersRepository.getAllUsers();
        }

        // GET: api/<UsersController>
        [HttpGet("Search")]
        [Authorize]
        public List<UserModel> Search(string searchLabel)
        {
            var allUsers = _usersRepository.getAllUsers();

            if (string.IsNullOrWhiteSpace(searchLabel))
            {
                return allUsers;
            }

            var myUser = from user in allUsers
                         where user.Forename.Contains(searchLabel) ||
                               user.Surname.Contains(searchLabel) ||
                               user.Telephone.Contains(searchLabel) ||
                               user.Mail.Contains(searchLabel)
                        select user;

            

            return myUser.ToList();
        }

        // GET api/<UsersController>/5
        [HttpGet("{id}")]
        public string Get(int id)
        {
            return "value";
        }

        // POST api/<UsersController>
        [HttpPost]
        public void Post([FromBody] string value)
        {
        }

        // PUT api/<UsersController>/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE api/<UsersController>/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
