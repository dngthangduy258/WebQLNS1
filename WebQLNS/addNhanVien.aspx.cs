using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
namespace WebQLNS
{
    public partial class addNhanVien : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string chuoi_ket_noi = ConfigurationManager.ConnectionStrings["QLNhanVienConnectionString5"].ConnectionString;
            SqlConnection conn = new SqlConnection(chuoi_ket_noi);

            conn.Open();
            string sql = "INSERT INTO NhanVien(honv,tennv,phai,ngaysinh,noisinh,maphong) values (@honv,@tennv,@phai,@ngaysinh,@noisinh,@maphong)";
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@honv", txtHo.Text);
            cmd.Parameters.AddWithValue("@tennv", txtTen.Text);
            if (radNam.Checked)
                cmd.Parameters.AddWithValue("@phai", true); 
            else 
                cmd.Parameters.AddWithValue("@phai", false);

            cmd.Parameters.AddWithValue("@ngaysinh", txtNgaySinh.Text);
            cmd.Parameters.AddWithValue("@noisinh", txtNoiSinh.Text);
            cmd.Parameters.AddWithValue("@maphong", ddlPhong.SelectedValue);

            int check = cmd.ExecuteNonQuery();
            if (check > 0)
            {
                thongBao.Text = "Thêm thành công!";
            }
            else
            {
                thongBao.Text = "Thêm thất bại!";
            }

        }
    }
}