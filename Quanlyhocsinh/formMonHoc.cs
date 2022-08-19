using DevExpress.XtraEditors;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using BussinessLayer;
using DataAccessLayer;

namespace Quanlyhocsinh
{
    public partial class formMonHoc : DevExpress.XtraEditors.XtraForm
    {
        public formMonHoc()
        {
            InitializeComponent();
        }
        bool _them;
        MonHoc monHoc;
        int id = 0;
        private void splitContainer1_Panel1_Paint(object sender, PaintEventArgs e)
        {

        }

        private void formMonHoc_Load(object sender, EventArgs e)
        {
           ShowHide(true);
            monHoc = new MonHoc();
            LoadData();
        }
        void LoadData()
        {
            monHoc = new MonHoc();
            gcDanhSach.DataSource = monHoc.getList();
            gvDanhSach.OptionsBehavior.Editable = false;
        }
        void ShowHide(bool kt)
        {
            btnLuu.Enabled = !kt;
            btnHuy.Enabled = !kt;
            btnThem.Enabled = kt;
            btnSua.Enabled = kt;
            btnXoa.Enabled = kt;
            btnDong.Enabled = kt;
            btnIn.Enabled = kt;
            txtTenMH.Enabled = !kt;
            spinHeSo.Enabled = !kt;
            spinSoTiet.Enabled = !kt;
        }

        private void btnThem_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            ShowHide(false);
            _them = true;
        }

        private void btnSua_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            ShowHide(false);
            _them = false;
        }

        private void btnXoa_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            if(MessageBox.Show("Bạn có chắc muốn xoá không?","Thông báo",MessageBoxButtons.YesNo,MessageBoxIcon.Warning) == DialogResult.Yes)
            {
                monHoc.Delete(id, Common.UserStatic.UID);
            }
            LoadData();
        }

        private void btnLuu_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            SaveData();
            LoadData();
            ShowHide(true);
        }

        private void btnHuy_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            ShowHide(true);
        }

        private void btnDong_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            this.Close();
        }

        private void btnIn_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {

        }
        void SaveData()
        {
            if (_them)
            {
                tbl_MonHoc mh = new tbl_MonHoc();
                mh.TenMH = txtTenMH.Text;
                mh.SoTiet = int.Parse(spinSoTiet.Text);
                mh.HeSo = int.Parse(spinHeSo.Text);
                mh.CrearedBy = Common.UserStatic.UID;
                mh.CreatedDate = DateTime.Now;
                monHoc.Add(mh);
            }
            else
            {
                tbl_MonHoc mh = monHoc.getItem(id);
                mh.TenMH = txtTenMH.Text;
                mh.SoTiet = int.Parse(spinSoTiet.Text);
                mh.HeSo = int.Parse(spinHeSo.Text);
                mh.CrearedBy = Common.UserStatic.UID;
                mh.CreatedDate = DateTime.Now;
                monHoc.Update(mh);
            }
        }

        private void gvDanhSach_Click(object sender, EventArgs e)
        {
            if(gvDanhSach.RowCount > 0)
            {
                id = int.Parse(gvDanhSach.GetFocusedRowCellValue("MaMH").ToString());
                txtTenMH.Text = gvDanhSach.GetFocusedRowCellValue("TenMH").ToString();
                spinHeSo.Text = gvDanhSach.GetFocusedRowCellValue("HeSo").ToString();
                spinSoTiet.Text = gvDanhSach.GetFocusedRowCellValue("SoTiet").ToString();
            }
        }

        private void gvDanhSach_CustomDrawCell(object sender, DevExpress.XtraGrid.Views.Base.RowCellCustomDrawEventArgs e)
        {
            if (e.Column.Name == "DeletedBy" && e.CellValue != null)
            {
                Image img = Properties.Resources.Cancel_16x16;

                e.Graphics.DrawImage(img, e.Bounds.X, e.Bounds.Y);
                e.Handled = true;
            }
        }
    }
}