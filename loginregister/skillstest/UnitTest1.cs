using loginregister.Controllers;
using loginregister.Models;
using NUnit.Framework;
using System.Collections.Generic;

namespace Tests
{
    public class Tests
    {
        [SetUp]
        public void Setup()
        {
        }

        [Test]
        public void GetAllSkillsCorrect()
        {
            //var testProducts = GetTestProducts();
            var controller = new AdminController();

            var result = controller.Getskills() as List<Skills>;
            Assert.AreEqual(6, result.Count);
        }
        [Test]
        public void GetAllSkillsIncorrect()
        {
            //var testProducts = GetTestProducts();
            var controller = new AdminController();

            var result = controller.Getskills() as List<Skills>;
            Assert.AreEqual(4, result.Count);
        }
        [Test]
        public void GetAdminCorrect()
        {
            //var testProducts = GetTestProducts();
            var controller = new loginregisterController();
            string uname = "jk@gmail.com";
            string pass = "jk";
            var result = controller.GetAdmin(uname,pass) as Admin;
            Assert.AreEqual("jk@gmail.com", result.AUsername);
        }
        [Test]
        public void GetAdminIncorrect()
        {
            //var testProducts = GetTestProducts();
            var controller = new loginregisterController();
            string uname = "jeni@gmail.com";
            string pass = "jeni";
            var result = controller.GetAdmin(uname, pass) as Admin;
            Assert.AreEqual("jeni@gmail.com", result.AUsername);
        }
    }
}