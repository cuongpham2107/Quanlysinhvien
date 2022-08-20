using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessLayer;

namespace BussinessLayer
{
    public class GiaoVien
    {
        QuanlyEntities db = null;
        public GiaoVien()
        {
            db = new QuanlyEntities();
        }
        public tbl_GiaoVien getItem(tbl_GiaoVien gv)
        {
            return db.tbl_GiaoVien.FirstOrDefault(x => x.MaGV == gv.MaGV);
        }
        public List<tbl_GiaoVien> getList()
        {
            return db.tbl_GiaoVien.ToList();
        }
        public tbl_GiaoVien Add(tbl_GiaoVien gv)
        {
            try
            {
                db.tbl_GiaoVien.Add(gv);
                db.SaveChanges();
                return gv;
            }
            catch (Exception e)
            {

                throw new Exception("Lỗi :" + e.Message);
            }
        }
    }
}
