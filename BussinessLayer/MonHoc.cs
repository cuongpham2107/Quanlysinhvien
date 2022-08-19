using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessLayer;

namespace BussinessLayer
{
    public class MonHoc
    {
        QuanlyEntities db = null;

        public MonHoc()
        {
            db = new QuanlyEntities();
        }
        public tbl_MonHoc getItem(int maMh)
        {
            return db.tbl_MonHoc.FirstOrDefault(x => x.MaMH == maMh);
        }
        public List<tbl_MonHoc> getList()
        {
            return db.tbl_MonHoc.ToList();
        }
        public tbl_MonHoc Add(tbl_MonHoc mh)
        {
            try
            {
                db.tbl_MonHoc.Add(mh);
                db.SaveChanges();
                return mh;
            }
            catch (Exception e)
            {

                throw new Exception("Lỗi :" + e.Message);
            }
        }
        public tbl_MonHoc Update(tbl_MonHoc mh)
        {
            try
            {
                var data = db.tbl_MonHoc.FirstOrDefault(x => x.MaMH == mh.MaMH);
                data.TenMH = mh.TenMH;
                data.SoTiet = mh.SoTiet;
                data.HeSo = mh.HeSo;
                data.UpdatedBy = mh.UpdatedBy;
                data.UpdatedDate = mh.UpdatedDate;
                db.SaveChanges();
                return mh;
            }
            catch (Exception e)
            {

                throw new Exception("Lỗi :" +e.Message);
            }
        }
        public void Delete(int maMH, int UserID)
        {
            try
            {
                var data = db.tbl_MonHoc.FirstOrDefault(x => x.MaMH == maMH);
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
