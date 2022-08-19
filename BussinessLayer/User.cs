using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessLayer;

namespace BussinessLayer
{
    public class User
    {
        QuanlyEntities db;
        public User()
        {
            db = new QuanlyEntities(); 
        } 
        public Boolean Login(string username, string password)
        {
            var kq = db.tbl_User.FirstOrDefault(u => u.username == username && u.password == password);     
            if(kq != null)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        public tbl_User getItem(string username)
        {
            return db.tbl_User.FirstOrDefault(u => u.username == username);
            
        }
    }
}
