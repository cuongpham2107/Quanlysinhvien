using DevExpress.XtraBars;
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
using System.Drawing;

namespace Quanlyhocsinh
{
    public partial class MainForm : DevExpress.XtraBars.Ribbon.RibbonForm
    {
        public MainForm()
        {
            InitializeComponent();
        }
        OverlayWindowOptions options = new OverlayWindowOptions(
            backColor: Color.Black,
            opacity: 0.5,
            fadeIn: false,
            fadeOut:false
        );
        IOverlaySplashScreenHandle ShowProgressPanel(Control control, OverlayWindowOptions option)
        {
            return SplashScreenManager.ShowOverlayForm(control, option);
        }
        private void MainForm_Load(object sender, EventArgs e)
        {
            Common.handle = ShowProgressPanel(this, options);
            formLogin form = new formLogin();
            form.ShowDialog();
        }
    }
}