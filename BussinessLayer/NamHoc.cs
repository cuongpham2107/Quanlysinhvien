using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessLayer;

namespace BussinessLayer
{
    public class NamHoc
    {
        QuanlyEntities db = null;

        public NamHoc()
        {
            db = new QuanlyEntities();
        }
        public tbl_NamHoc getItem(int maNh)
        {
            return db.tbl_NamHoc.FirstOrDefault(x => x.MaNamHoc == maNh);
        }
        public List<tbl_NamHoc> getList()
        {
            return db.tbl_NamHoc.ToList();
        }
        public tbl_NamHoc Add(tbl_NamHoc nh)
        {
            try
            {
                db.tbl_NamHoc.Add(nh);
                db.SaveChanges();
                return nh;
            }
            catch (Exception e)
            {

                throw new Exception("Lỗi :" + e.Message);
            }
        }
        public tbl_NamHoc Update(tbl_NamHoc nh)
        {
            try
            {
                var data = db.tbl_NamHoc.FirstOrDefault(x => x.MaNamHoc == nh.MaNamHoc);
                data.TenNamHoc = nh.TenNamHoc;
                data.UpdatedBy = nh.UpdatedBy;
                data.UpdatedDate = nh.UpdatedDate;
                db.SaveChanges();
                return nh;
            }
            catch (Exception e)
            {

                throw new Exception("Lỗi :" + e.Message);
            }
        }
        public void Delete(int maNH, int UserID)
        {
            try
            {
                var data = db.tbl_NamHoc.FirstOrDefault(x => x.MaNamHoc == maNH);
                data.DeletedBy = UserID;
                data.DeletedDate = DateTime.Now;
                db.SaveChanges();
            }
            catch (Exception e)
            {

                throw new Exception("Lỗi :" + e.Message);
            }
        }
    }
}
