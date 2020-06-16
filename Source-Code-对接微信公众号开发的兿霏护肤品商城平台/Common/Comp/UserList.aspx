<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserList.aspx.cs" Inherits="ZoomLaCMS.Common.Comp.UserList" %>
<table class="table table-bordered table-striped margin_t5">
    <tr>
        <td class="td_s">ID</td>
        <td>用户名</td>
        <td>名称</td>
        <td class="td_m">操作</td>
    </tr>
        <asp:Repeater runat="server" ID="User_RPT">
            <ItemTemplate>
                <tr id="ulist_<%#Eval("UserID") %>">
                    <td><%#Eval("UserID") %></td>
                    <td><%#Eval("UserName") %></td>
                    <td><%#Eval("HoneyName") %></td>
                    <td><a href="javascript:;" onclick="<%#del+"(this,"+Eval("UserID")+")"%>;"><i class="fa fa-trash-o"></i></a></td>
                </tr>
            </ItemTemplate>
        </asp:Repeater>
</table>