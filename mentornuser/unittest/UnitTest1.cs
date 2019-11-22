using mentornuser.Controllers;
using mentornuser.Models;
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
        public void GetmentorskillsCorrect()
        {
           
            var controller = new mentorController();

            var result = controller.Getmentorskills() as List<Mentorskills>;
            Assert.AreEqual(5, result.Count);
        }
        [Test]
        public void GetmentorskillsIncorrect()
        {
           
            var controller = new mentorController();

            var result = controller.Getmentorskills() as List<Mentorskills>;
            Assert.AreEqual(4, result.Count);
        }

        [Test]
        public void dispmentorCorrect()
        {
            
            var controller = new userController();

            var result = controller.dispmentor() as List<dispuserpage>;
            Assert.AreEqual(5, result.Count);
        }
        [Test]
        public void dispmentorIncorrect()
        {
           
            var controller = new userController();

            var result = controller.dispmentor() as List<dispuserpage>;
            Assert.AreEqual(3, result.Count);
        }
    }
}