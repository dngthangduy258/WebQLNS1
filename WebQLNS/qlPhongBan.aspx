<%@ Page Title="" Language="C#" MasterPageFile="~/SiteLayout.Master" AutoEventWireup="true" CodeBehind="qlPhongBan.aspx.cs" Inherits="WebQLNS.qlPhongBan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="NoiDung" runat="server">
    <style>
        .pagination td {
            border: 1px solid transparent !important;
        }

        .pagination span, .pagination a {
            display: flex !important;
            justify-content: center;
            align-items: center;
            height: 30px;
            width: 30px;
            padding: 10px;
            font-size: 12px;
            border-radius: 50px;
            text-decoration: none !important;
        }

        .pagination span {
            background: #C44569;
        }

        .pagination a,
        .pagination a:visited {
            color: #000;
        }
        .pagination a:hover,
        .pagination a:active {
            background-color: #C44569;
        }
        /* Centering the dropdown */
        .text-center {
            text-align: center;
        }

        /* Setting the width */
        .w-25 {
            width: 25%;
        }

        /* Margin auto for centering */
        .m-auto {
            margin: auto;
        }

        /* Styling the dropdown */
        #ctl198 {
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
            width: 100%; /* Adjust width as needed */
            box-sizing: border-box; /* Ensures padding and border are included in width */
        }
    </style>
    <form id="form1" runat="server">
        <h1 class="text-center">QUẢN LÝ PHÒNG BAN<asp:SqlDataSource runat="server" ConnectionString="<%$ ConnectionStrings:DSNhanVienPhongBan %>" ProviderName="<%$ ConnectionStrings:DSNhanVienPhongBan.ProviderName %>" SelectCommand="SELECT * FROM [NhanVien] WHERE ([MaPhong] = @MaPhong)" ID="ctl202">
            <SelectParameters>
                <asp:ControlParameter ControlID="ctl198" PropertyName="SelectedValue" Name="MaPhong" Type="Int32"></asp:ControlParameter>
            </SelectParameters>
        </asp:SqlDataSource>
        </h1>
        <div class="text-center w-25 m-auto mb-2 p-3">
            <asp:DropDownList  runat="server" AutoPostBack="True" DataTextField="TenPhong" DataValueField="MaPhong" DataSourceID="ctl05" ID="ctl198"></asp:DropDownList>
        </div>
        <div>
        <asp:SqlDataSource runat="server" ConnectionString="<%$ ConnectionStrings:QLNhanVienConnectionString3 %>" DeleteCommand="DELETE FROM [PhongBan] WHERE [MaPhong] = @MaPhong" InsertCommand="INSERT INTO [PhongBan] ([TenPhong]) VALUES (@TenPhong)" ProviderName="<%$ ConnectionStrings:QLNhanVienConnectionString3.ProviderName %>" SelectCommand="SELECT * FROM [PhongBan]" UpdateCommand="UPDATE [PhongBan] SET [TenPhong] = @TenPhong WHERE [MaPhong] = @MaPhong" ID="ctl05">
            <DeleteParameters>
                <asp:Parameter Name="MaPhong" Type="Int32"></asp:Parameter>
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="TenPhong" Type="String"></asp:Parameter>
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="TenPhong" Type="String"></asp:Parameter>
                <asp:Parameter Name="MaPhong" Type="Int32"></asp:Parameter>
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:GridView CssClass="w-75 m-auto" ID="gvNhanVien" runat="server" DataSourceID="ctl202" AutoGenerateColumns="False" AllowPaging="true" PageSize="5"
            BackColor="White" BorderColor="#999999" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" BorderStyle="Solid">
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <Columns>
                <asp:BoundField DataField="MaNV" HeaderText="Mã nhân viên" InsertVisible="False" ReadOnly="True" SortExpression="MaNV" />
                <asp:BoundField DataField="HoNV" HeaderText="Họ nhân viên" SortExpression="HoNV" />
                <asp:BoundField DataField="TenNV" HeaderText="Tên nhân viên" SortExpression="TenNV" />
                <asp:CheckBoxField DataField="Phai" HeaderText="Phái" SortExpression="Phai" />
                <asp:BoundField DataFormatString="{0:dd/MM/yyyy}" DataField="NgaySinh" HeaderText="Ngày sinh" SortExpression="NgaySinh" />
                <asp:BoundField DataField="NoiSinh" HeaderText="Nơi sinh" SortExpression="NoiSinh" />
                <asp:BoundField DataField="MaPhong" HeaderText="Mã phòng" SortExpression="MaPhong" />

                <asp:CommandField ControlStyle-CssClass="btn btn-success" ShowEditButton="true" ButtonType="Button" ItemStyle-CssClass="text-center" ShowDeleteButton="true" />

            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#000099" ForeColor="White" Font-Bold="True" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
            <EmptyDataTemplate>
                <div class="h3 text-danger">Không có dữ liệu nhân viên</div>
            </EmptyDataTemplate>
        </asp:GridView>
            </div>
    </form>
</asp:Content>
