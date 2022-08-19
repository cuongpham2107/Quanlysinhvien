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
using DevExpress.XtraSplashScreen;
using BussinessLayer;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace Quanlyhocsinh
{
    public partial class formLogin : DevExpress.XtraEditors.XtraForm
    {
        public formLogin()
        {
            InitializeComponent();
            
        }
        User _user;
        private void formLogin_Load(object sender, EventArgs e)
        {
            _user = new User();
           
        }

        private void textEdit1_EditValueChanged(object sender, EventArgs e)
        {

        }

        private void btnExit_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void simpleButton1_Click(object sender, EventArgs e)
        {
            bool lg = _user.Login(txtUserName.Text, txtPassword.Text);
            if(lg == true)
            {
                Common.UserStatic = _user.getItem(txtUserName.Text);
                MainForm main =(MainForm)Application.OpenForms["MainForm"];
                main.lbFullName.Caption = Common.UserStatic.fullname;
                if (Common.handle != null)
                {
                    SplashScreenManager.CloseOverlayForm(Common.handle);
                }
                this.Close();
            }
            else
            {
                MessageBox.Show("Tên đăng nhâp hoặc mật khẩu Không đúng", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }
            
        }
    }
}