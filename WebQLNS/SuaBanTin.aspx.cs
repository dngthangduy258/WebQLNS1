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
    public partial class SuaBanTin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int id = int.Parse(Request.QueryString["id"]);

                string chuoi_ket_noi = ConfigurationManager.ConnectionStrings["TinTucDBConnectionString"].ConnectionString;
                SqlConnection conn = new SqlConnection(chuoi_ket_noi);

                conn.Open();
                string sql = "SELECT * FROM BanTin WHERE id = "+id;

                SqlCommand cmd = new SqlCommand(sql, conn);
                SqlDataReader rd = cmd.ExecuteReader();
                if (rd.Read())
                {
                    txtTieuDe.Text = rd["tieude"].ToString();
                    txtTomTat.Text = rd["tomtat"].ToString();
                    txtNoiDung.Text = rd["noidung"].ToString();
                    txtNgayDang.Text = rd["ngaydang"].ToString();
                    ddlTheLoai.SelectedValue = rd["theloaiid"].ToString();

                    chkTrangThai.Checked = bool.Parse(rd["trangthai"].ToString());

                }
            }
        }

        protected void btnLuu_Click(object sender, EventArgs e)
        {
            string chuoi_ket_noi = ConfigurationManager.ConnectionStrings["TinTucDBConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(chuoi_ket_noi);

            conn.Open();
            string sql = "UPDATE BanTin SET tieude=@tieude,tomtat=@tomtat,noidung=@noidung,hinh=@hinh,ngaydang=@ngaydang,trangthai=@trangthai,theloaiid=@theloaiid WHERE id = @id";
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@tieude", txtTieuDe.Text);
            cmd.Parameters.AddWithValue("@tomtat", txtTomTat.Text);
            cmd.Parameters.AddWithValue("@noidung", txtNoiDung.Text);
            //Xử lý upload hình
            if (fileHinh.HasFile)
            {
                //xu ly upload hinh
                string duong_dan = Server.MapPath("~/Uploads/") + fileHinh.FileName;
                fileHinh.SaveAs(duong_dan);
                cmd.Parameters.AddWithValue("@hinh", fileHinh.FileName);
            }
            else //ko chọn hình mới
            {
                cmd.Parameters.AddWithValue("@hinh", lbOldImg.Text);
            }

            cmd.Parameters.AddWithValue("@ngaydang", txtNgayDang.Text);
            cmd.Parameters.AddWithValue("@trangthai", chkTrangThai.Checked);
            cmd.Parameters.AddWithValue("@theloaiid", ddlTheLoai.SelectedValue);
            cmd.Parameters.AddWithValue("@id", Request.QueryString["id"]);

            //thực hiện câu lệnh truy vấn đến CSDL
            if (cmd.ExecuteNonQuery() > 0)
                Response.Redirect("qlTinTuc.aspx");
            else
                thongBao.Text = "Thao tác cập nhật bản tin thất bại";

        }
    }
}