<%@ Page Title="" Language="C#" MasterPageFile="~/SiteLayout.Master" AutoEventWireup="true" CodeBehind="addNhanVien.aspx.cs" Inherits="WebQLNS.addNhanVien" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="NoiDung" runat="server">
    <form runat="server">
        <div class="container">
            <div class="row mb-2">
                <div class="row col-2">Họ nhân viên:</div>
                <asp:TextBox ID="txtHo" CssClass="row col-10" runat="server"></asp:TextBox>
            </div>
            <div class="row mb-2">
                <div class="row col-2">Tên nhân viên:</div>
                <asp:TextBox CssClass="row col-10" ID="txtTen" runat="server"></asp:TextBox>
            </div>
            <div class="row mb-2">
                <div class="row col-2">Phái:</div>
                <div cssclass="row col-10">
                    <asp:RadioButton ID="radNu" GroupName="radGioiTinh" runat="server" Text="Nữ"/>
                   
                <asp:RadioButton ID="radNam" Checked="true" GroupName="radGioiTinh" runat="server" Text="Nam" />
                    
                </div>
            </div>
            <div class="row mb-2">
                <div class="row col-2">Ngày sinh:</div>
                <asp:TextBox CssClass="row col-10" type="date" ID="txtNgaySinh" runat="server"></asp:TextBox>
            </div>
            <div class="row mb-2">
                <div class="row col-2">Nơi sinh:</div>
                <asp:TextBox CssClass="row col-10" ID="txtNoiSinh" runat="server"></asp:TextBox>
            </div>
            <div class="row mb-2">
                <div class="row col-2">Phòng ban:</div>
                <asp:DropDownList CssClass="row col-10 w-100" ID="ddlPhong" runat="server" DataSourceID="SqlDataSource1" DataTextField="TenPhong" DataValueField="MaPhong"></asp:DropDownList>
            </div>
            <div class="row mb-2">
                <asp:Button CssClass="btn btn-success" ID="Button1" runat="server" Text="Lưu" OnClick="Button1_Click" />
            </div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:QLNhanVienConnectionString5 %>" SelectCommand="SELECT * FROM [PhongBan]"></asp:SqlDataSource>
            <asp:Label ID="thongBao" runat="server" Text=""></asp:Label>
        </div>
        </form>

</asp:Content>
