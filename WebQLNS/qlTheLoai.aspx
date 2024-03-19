<%@ Page Title="" Language="C#" MasterPageFile="~/SiteLayout.Master" AutoEventWireup="true" CodeBehind="qlTheLoai.aspx.cs" Inherits="WebQLNS.qlTheLoai" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="NoiDung" runat="server">
    <style>
        /* Định dạng cho tiêu đề */
        h1.text-center {
            text-align: center;
            font-size: 24px;
            font-weight: bold;
            color: #333333;
            margin-bottom: 20px;
        }

        /* Định dạng cho bảng ngoài */
        table {
            width: 100%;
            border-collapse: collapse;
            border-spacing: 0;
        }

        /* Định dạng cho bảng bên trong */
        #NoiDung_ListView1_itemPlaceholderContainer {
            background-color: #FFFFFF;
            border: 1px solid #999999;
            font-family: 'Roboto', sans-serif;
        }

            /* Định dạng cho hàng tiêu đề */
            #NoiDung_ListView1_itemPlaceholderContainer th {
                background-color: #DCDCDC;
                color: #333333;
                font-weight: bold;
                padding: 10px;
            }

            /* Định dạng cho các ô dữ liệu */
            #NoiDung_ListView1_itemPlaceholderContainer td {
                padding: 10px;
            }

            /* Định dạng cho màu nền xen kẽ giúp dễ đọc */
            #NoiDung_ListView1_itemPlaceholderContainer tr:nth-child(even) {
                background-color: #F5F5F5;
            }

        /* Định dạng cho nút xóa và sửa */
        input[type="submit"] {
            padding: 8px 16px;
            background-color: #4CAF50; /* Màu xanh lá cây */
            border: none;
            color: white;
            cursor: pointer;
            margin-right: 5px;
            border-radius: 4px;
        }

            input[type="submit"]:hover {
                background-color: #45a049; /* Màu xanh lá tối */
            }

        /* Canh giữa hàng cuối cùng */
        #NoiDung_ListView1_itemPlaceholderContainer tr:last-child td {
            text-align: center;
            background-color: #CCCCCC;
        }
    </style>
    <h1 class="text-center">Quản Lý Thể Loại</h1>

    <asp:SqlDataSource ID="dsTheLoai" runat="server" ConnectionString="<%$ ConnectionStrings:TinTucDBConnectionString %>" DeleteCommand="DELETE FROM [TheLoai] WHERE [Id] = @Id" InsertCommand="INSERT INTO [TheLoai] ([TenTheLoai], [TrangThai]) VALUES (@TenTheLoai, @TrangThai)" SelectCommand="SELECT * FROM [TheLoai]" UpdateCommand="UPDATE [TheLoai] SET [TenTheLoai] = @TenTheLoai, [TrangThai] = @TrangThai WHERE [Id] = @Id">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="TenTheLoai" Type="String" />
            <asp:Parameter Name="TrangThai" Type="Boolean" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="TenTheLoai" Type="String" />
            <asp:Parameter Name="TrangThai" Type="Boolean" />
            <asp:Parameter Name="Id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="Id" DataSourceID="dsTheLoai" InsertItemPosition="LastItem">
        <AlternatingItemTemplate>
            <tr style="background-color: #FFF8DC;">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                </td>
                <td>
                    <asp:Label ID="TenTheLoaiLabel" runat="server" Text='<%# Eval("TenTheLoai") %>' />
                </td>
                <td>
                    <asp:CheckBox ID="TrangThaiCheckBox" runat="server" Checked='<%# Eval("TrangThai") %>' Enabled="false" />
                </td>
            </tr>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <tr style="background-color: #008A8C; color: #FFFFFF;">
                <td>
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                </td>
                <td>
                    <asp:Label ID="IdLabel1" runat="server" Text='<%# Eval("Id") %>' />
                </td>
                <td>
                    <asp:TextBox ID="TenTheLoaiTextBox" runat="server" Text='<%# Bind("TenTheLoai") %>' />
                </td>
                <td>
                    <asp:CheckBox ID="TrangThaiCheckBox" runat="server" Checked='<%# Bind("TrangThai") %>' />
                </td>
            </tr>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px;">
                <tr>
                    <td>No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                </td>
                <td>&nbsp;</td>
                <td>
                    <asp:TextBox ID="TenTheLoaiTextBox" runat="server" Text='<%# Bind("TenTheLoai") %>' />
                </td>
                <td>
                    <asp:CheckBox ID="TrangThaiCheckBox" runat="server" Checked='<%# Bind("TrangThai") %>' />
                </td>
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr style="background-color: #DCDCDC; color: #000000;">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" OnClientClick="return confirm('Are you sure delete ?')" Text="Delete" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                </td>
                <td>
                    <asp:Label ID="TenTheLoaiLabel" runat="server" Text='<%# Eval("TenTheLoai") %>' />
                </td>
                <td>
                    <asp:CheckBox ID="TrangThaiCheckBox" runat="server" Checked='<%# Eval("TrangThai") %>' Enabled="false" />
                </td>
                
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px; font-family: Verdana, Arial, Helvetica, sans-serif;">
                            <tr runat="server" style="background-color: #DCDCDC; color: #000000;">
                                <th runat="server"></th>
                                <th runat="server">Id</th>
                                <th runat="server">TenTheLoai</th>
                                <th runat="server">TrangThai</th>
                            </tr>
                            <tr id="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="text-align: center; background-color: #CCCCCC; font-family: Verdana, Arial, Helvetica, sans-serif; color: #000000;"></td>
                </tr>
            </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <tr style="background-color: #008A8C; font-weight: bold; color: #FFFFFF;">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                </td>
                <td>
                    <asp:Label ID="TenTheLoaiLabel" runat="server" Text='<%# Eval("TenTheLoai") %>' />
                </td>
                <td>
                    <asp:CheckBox ID="TrangThaiCheckBox" runat="server" Checked='<%# Eval("TrangThai") %>' Enabled="false" />
                </td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>
</asp:Content>
