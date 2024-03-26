<%@ Page Title="" Language="C#" MasterPageFile="~/SiteLayout.Master" AutoEventWireup="true" CodeBehind="SuaBanTin.aspx.cs" Inherits="WebQLNS.SuaBanTin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="NoiDung" runat="server">
    <style>
        /* Thiết lập font chữ chung cho toàn bộ biểu mẫu */
        body {
            font-family: Arial, sans-serif;
        }

        /* Định dạng cho phần container chứa biểu mẫu */
        .container {
            width: 75%; /* Điều chỉnh độ rộng theo ý muốn */
            margin: 0 auto; /* Canh giữa biểu mẫu */
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        /* Định dạng cho tiêu đề của biểu mẫu */
        h1 {
            text-align: center;
        }

        /* Định dạng cho phần label */
        .row.col-2 {
        }

        /* Định dạng cho các input, textarea và select */
        

        /* Định dạng cho checkbox */
        input[type="checkbox"] {
            margin-top: 8px;
        }

        /* Định dạng cho nút Lưu */
        input[type="submit"] {
            width: 10%; /* Điều chỉnh độ rộng theo ý muốn */
            padding: 10px;
            background-color: #4CAF50; /* Màu xanh lá cây */
            border: none;
            color: white;
            border-radius: 4px;
            cursor: pointer;
            margin-top: 10px;
            margin:auto;
        }

        /* Định dạng cho thẻ span hiển thị thông báo */
        #NoiDung_thongBao {
            display: block;
            margin-top: 10px;
            color: #ff0000; /* Màu đỏ */
            font-style: italic;
            font-size: 14px;
        }
    </style>
    <script src="Scripts/ckeditor/ckeditor.js"></script>
    <form>
        <div class="container">
            <h1>Thêm bản tin</h1>
            <div class="row mb-2">
                <div class="row col-2">Tiêu đề:</div>
                <asp:TextBox ID="txtTieuDe" CssClass="row col-10" runat="server"></asp:TextBox>
            </div>
            <div class="row mb-2">
                <div class="row col-2">Tóm tắt:</div>
                <asp:TextBox CssClass="row col-10" ID="txtTomTat" TextMode="MultiLine" runat="server"></asp:TextBox>
            </div>
            <div class="row mb-2">
                <div class="row col-2">Nội dung:</div>
                <asp:TextBox CssClass="row col-10 ckeditor" ID="txtNoiDung" TextMode="MultiLine" runat="server"></asp:TextBox>
            </div>
            <div class="row mb-2">
                <div class="row col-2">Hình đại diện:</div>
                <asp:FileUpload CssClass="row col-10" ID="fileHinh" runat="server" />
                 <asp:Image ID="oldImg" runat="server" Width="200px" />
                 <asp:Label ID="lbOldImg" runat="server" Text="" Visible="true"></asp:Label>
            </div>
            <div class="row mb-2">
                <div class="row col-2">Đăng:</div>
                <asp:TextBox CssClass="row col-10" TextMode="date" ID="txtNgayDang" runat="server"></asp:TextBox>
            </div>
            <div class="row mb-2">
                <div class="row col-2">Trạng thái:</div>
                <asp:CheckBox CssClass="row col-10 text-center align-content-center" ID="chkTrangThai" runat="server" Text="Hiện" />
            </div>

            <div class="row mb-2">
                <div class="row col-2">Thể loại:</div>
                <asp:DropDownList CssClass="row col-10" ID="ddlTheLoai" runat="server" DataSourceID="dsTheLoai" DataTextField="TenTheLoai" DataValueField="Id"></asp:DropDownList>
            </div>
            <div class="row mb-2">
                <asp:Button CssClass="btn btn-success" ID="btnLuu" runat="server" Text="Lưu" OnClick="btnLuu_Click" />
            </div>
            <asp:SqlDataSource ID="dsTheLoai" runat="server" ConnectionString="<%$ ConnectionStrings:TinTucDBConnectionString %>" SelectCommand="SELECT * FROM [TheLoai]"></asp:SqlDataSource>
            <asp:Label ID="thongBao" runat="server" Text=""></asp:Label>
        </div>
    </form>
</asp:Content>
