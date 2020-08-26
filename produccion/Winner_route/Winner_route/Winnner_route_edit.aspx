<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Winnner_route_edit.aspx.cs" Inherits="Winnner_route_edit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />


    <meta http-equiv="X-UA-Compatible" content="IE=11" />
    <link type="text/css" href="Content/bootstrap.min.css" rel="stylesheet" />
    <script src="Scripts/jquery-1.9.1.min.js"></script>
    <script src="Scripts/jquery.bootstrap-growl.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>


   
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <!-- Panel starts -->
            <div class="panel panel-default" style="width: 900px; padding: 5px; margin: 5px">
                <div id="dvTab">
                    <!-- Navigation Tabs starts -->
                    <ul class="nav nav-tabs" role="tablist">
                        <li><a href="#tab1" aria-controls="tab1" role="tab" data-toggle="tab">Inicio</a></li>
                        <li><a href="#tab2" aria-controls="tab2" role="tab" data-toggle="tab">Tab2</a></li>
                        <li><a href="#tab3" aria-controls="tab3" role="tab" data-toggle="tab">Tab3</a></li>
                    </ul>
                    <!-- Navigation Tabs ends -->
                    <!-- Tab Panes starts -->
                    <div class="tab-content" style="padding-top: 10px">
                        <div role="tabpanel" class="tab-pane active" id="tab1">
                            <asp:Button Text="h" runat="server" />
                        </div>
                        <div role="tabpanel" class="tab-pane" id="tab2">
                            <asp:Button Text="f" runat="server" />
                        </div>
                        <div role="tabpanel" class="tab-pane" id="tab3">






                            <div class="panel panel-default" style="width: 900px; padding: 5px; margin: 0px">
                                <div id="dvTab2">
                                    <!-- Navigation Tabs starts -->
                                    <ul class="nav nav-tabs" role="tablist">
                                        <li><a href="#tab_edit_1" aria-controls="tab1" role="tab" data-toggle="tab">tab_edit_1</a></li>
                                        <li><a href="#tab_edit_2" aria-controls="tab2" role="tab" data-toggle="tab">tab_edit_2</a></li>
                                        <li><a href="#tab_edit_3" aria-controls="tab3" role="tab" data-toggle="tab">tab_edit_3</a></li>
                                    </ul>
                                    <!-- Navigation Tabs ends -->
                                    <!-- Tab Panes starts -->
                                    <div class="tab-content" style="padding-top: 10px">
                                        <div role="tabpanel" class="tab-pane active" id="tab_edit_1">
                                            <asp:Button Text="h" runat="server" />
                                        </div>
                                        <div role="tabpanel" class="tab-pane" id="tab_edit_2">
                                            <asp:Button Text="f" runat="server" />
                                        </div>
                                        <div role="tabpanel" class="tab-pane" id="tab_edit_3">
                                            <asp:Button Text="g" runat="server" />
                                        </div>
                                    </div>
                                    <!-- Tab Panes ends -->
                                </div>
                                <br />
                                <%--  <asp:Button ID="btnSubmit" Text="Submit" runat="server" OnClick="btnSubmit_Click" CssClass="btn btn-primary" />
                                      <asp:Button ID="btnSelectTab2" Text="Select Tab2" runat="server" OnClick="btnSelectTab2_Click" CssClass="btn btn-primary" />
                                      <asp:Button ID="btnSelectTab3" Text="Select Tab3" runat="server" OnClick="btnSelectTab3_Click" CssClass="btn btn-primary" />--%>
                                <asp:HiddenField ID="HiddenField1" runat="server" />
                            </div>








                        </div>
                    </div>
                    <!-- Tab Panes ends -->
                </div>
                <br />
                <%--  <asp:Button ID="btnSubmit" Text="Submit" runat="server" OnClick="btnSubmit_Click" CssClass="btn btn-primary" />
                <asp:Button ID="btnSelectTab2" Text="Select Tab2" runat="server" OnClick="btnSelectTab2_Click" CssClass="btn btn-primary" />
                <asp:Button ID="btnSelectTab3" Text="Select Tab3" runat="server" OnClick="btnSelectTab3_Click" CssClass="btn btn-primary" />--%>
                <asp:HiddenField ID="hfTab" runat="server" />
            </div>
            <!-- Panel ends -->
        </div>



        <asp:Button Text="text" OnClick="Unnamed_Click" runat="server" />

        <div id="listaChecks"></div>







    </form>
</body>
</html>
