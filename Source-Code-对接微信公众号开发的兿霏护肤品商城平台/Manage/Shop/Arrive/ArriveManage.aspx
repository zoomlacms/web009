﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ArriveManage.aspx.cs" Inherits="ZoomLaCMS.Manage.Shop.Arrive.ArriveManage" MasterPageFile="~/Manage/I/Default.master" %>

<%@ Register TagPrefix="ZL" TagName="UserGuide" Src="~/Manage/I/ASCX/UserGuide.ascx" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>优惠劵管理</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div class="top_opbar">
        <div class="input-group margin_t5" style="width:1185px;" >
            <div class="input-group-addon">类型</div>
            <asp:DropDownList runat="server" ID="Type_DP" class="form-control text_s">
                <asp:ListItem Value="-100" Selected="True">全部</asp:ListItem>
                <asp:ListItem Value="0">优惠券</asp:ListItem>
                <asp:ListItem Value="1">现金券</asp:ListItem>
            </asp:DropDownList>
            <div class="input-group-addon">状态</div>
            <asp:DropDownList runat="server" ID="State_DP" class="form-control text_s">
                <asp:ListItem Value="-100" Selected="True">全部</asp:ListItem>
                <asp:ListItem Value="10">已使用</asp:ListItem>
                <asp:ListItem Value="1">未使用</asp:ListItem>
            </asp:DropDownList>
            <asp:TextBox runat="server" ID="Name_T" class="form-control text_md" placeholder="优惠劵名" />
            <asp:TextBox runat="server" ID="UserName_T" class="form-control text_md" placeholder="用户名" />
            <asp:TextBox runat="server" ID="AgainTime_T" class="form-control text_md" placeholder="有效时间" onclick="WdatePicker({maxDate:'#F{$dp.$D(\'EndTime_T\')}'});" />
            <asp:TextBox runat="server" ID="EndTime_T" class="form-control text_md" placeholder="过期时间" onclick="WdatePicker({minDate:'#F{$dp.$D(\'AgainTime_T\')}'});" />
            <span class="input-group-btn">
                <asp:Button ID="Skey_Btn" runat="server" Text="搜索" class="btn btn-primary" OnClick="Skey_Btn_Click" />
            </span>
        </div>
    </div>
    <div class="clearbox"></div>
    <ul class="nav nav-tabs">
        <li class="b_all active"><asp:LinkButton ID="ShowAll_B" runat="server" OnClick="ShowAll_B_Click" Text="全部" /></li>
        <li class="b_isbind"><asp:LinkButton ID="ShowBind_B" runat="server" OnClick="ShowBind_B_Click" Text="已颁发" /></li>
        <li class="b_nobind"><asp:LinkButton ID="ShowNoBind_B" runat="server" OnClick="ShowNoBind_B_Click" Text="未颁发" /></li>
        <li class="b_expired"><asp:LinkButton ID="ShowExpired_B" runat="server" OnClick="ShowExpired_B_Click" Text="已过期" /></li>
    </ul>
    <ZL:ExGridView ID="EGV" runat="server" AutoGenerateColumns="false" AllowPaging="true" PageSize="20" EnableTheming="False" EmptyDataText="当前无数据"
        OnRowCommand="EGV_RowCommand" OnRowDataBound="EGV_RowDataBound" OnPageIndexChanging="EGV_PageIndexChanging" class="table table-striped table-bordered table-hover">
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <input type="checkbox" name="idchk" value="<%# Eval("ID") %>" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ID" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                <ItemTemplate>
                    <asp:Label ID="Id" runat="server" Text='<%# Eval("ID") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="卡别名" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                <ItemTemplate>
                    <%# Eval("ArriveName") %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="编号" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                <ItemTemplate>
                    <asp:Label ID="lblNo" runat="server" Text='<%#Eval("ArriveNO") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="密码" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                <ItemTemplate>
                    <asp:Label ID="lblPwd" runat="server" Text='<%#Eval("ArrivePwd") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="金额" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                <ItemTemplate>
                    <asp:Label ID="lblAmount" runat="server" Text='<%#Eval("Amount","{0:f2}") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="所属用户" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                <ItemTemplate>
                    <asp:Label ID="lblUser" runat="server" Text='<%#Eval("UserName")%>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="生效时间" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                <ItemTemplate>
                    <asp:Label ID="lblAginTime" runat="server" Text='<%# Eval("AgainTime","{0:yyyy-MM-dd}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="到期时间" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                <ItemTemplate>
                    <%#Eval("EndTime","{0:yyyy-MM-dd}") %>
                </ItemTemplate>
            </asp:TemplateField>
            <%--                <asp:TemplateField HeaderText="使用时间" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                    <ItemTemplate>
                      <%#Eval("UseTime","{0:yyyy-MM-dd}") %>
                    </ItemTemplate>
                </asp:TemplateField>--%>
            <asp:TemplateField HeaderText="状态" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                <ItemTemplate>
                    <%#GetState() %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="类型" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                <ItemTemplate>
                    <%# Eval("Type","").Equals("1") ? "现金券":"优惠券" %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="操作" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                <ItemTemplate>
                    <a href="AddArrive.aspx?id=<%#Eval("id") %>" class="option_style"><i class="fa fa-pencil" title="修改"></i>修改</a>
                    <asp:LinkButton runat="server" CssClass="option_style" CommandName="del2" CommandArgument='<%#Eval("ID") %>' OnClientClick="return confirm('确定要删除吗?');"><i class="fa fa-trash-o" title="删除"></i>删除</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
    <input type="button" class="btn btn-primary" value="绑定用户" onclick="SelUser();" />
    <asp:Button runat="server" ID="batActive" OnClick="batActive_Click" Text="批量激活" class="btn btn-primary" />
    <asp:Button runat="server" ID="batBtn" OnClick="BtnDelete_Click" Text="批量删除" class="btn btn-primary" OnClientClick="return confirm('确定要删除选中吗');" />
    <asp:HiddenField ID="BindUserID_H" runat="server" />
    <asp:HiddenField ID="IsBind_Hid" runat="server" Value="all" />
    <asp:Button ID="BindUser_B" runat="server" CssClass="hidden" OnClick="BindUser_B_Click" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script src="/JS/SelectCheckBox.js"></script>
    <script src="/JS/DatePicker/WdatePicker.js"></script>
    <script src="/JS/Controls/ZL_Dialog.js"></script>
    <script>
    function showtab(str) {
        $(".b_" + str).addClass("active").siblings("li").removeClass("active");
    }
    var diag = new ZL_Dialog();
    function SelUser() {
        diag.title = "选择用户";
        diag.maxbtn = false;
        diag.url = "/Common/Dialog/SelGroup.aspx";
        diag.ShowModal();
    }
    function UserFunc(list, select) {
        $("#BindUserID_H").val(list[0].UserID);
        diag.CloseModal();
        $("#BindUser_B").click();
    }
    </script>
</asp:Content>
