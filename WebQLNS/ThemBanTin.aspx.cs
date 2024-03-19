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
    public partial class ThemBanTin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLuu_Click(object sender, EventArgs e)
        {
            string chuoi_ket_noi = ConfigurationManager.ConnectionStrings["TinTucDBConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(chuoi_ket_noi);

            conn.Open();
            string sql = "INSERT INTO BanTin(tieude,tomtat,noidung,hinh,ngaydang,trangthai,theloaiid) values (@tieude,@tomtat,@noidung,@hinh,@ngaydang,@trangthai,@theloaiid)";
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@tieude", txtTieuDe.Text);
            cmd.Parameters.AddWithValue("@tomtat", txtTomTat.Text);
            cmd.Parameters.AddWithValue("@noidung", txtNoiDung.Text);
            //Xử lý upload hình
            if (fileHinh.HasFile) { 
            string path = Server.MapPath("~/Upload/") + fileHinh.FileName;
            fileHinh.SaveAs(path);
            cmd.Parameters.AddWithValue("@hinh", fileHinh.FileName);
            }
            else
            {
                cmd.Parameters.AddWithValue("@hinh", "no_image.png");
            }
            cmd.Parameters.AddWithValue("@ngaydang", txtNgayDang.Text);

            if (chkTrangThai.Checked)
                cmd.Parameters.AddWithValue("@trangthai", 1);
            else
                cmd.Parameters.AddWithValue("@trangthai", 0);

            cmd.Parameters.AddWithValue("@theloaiid", ddlTheLoai.SelectedValue);

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