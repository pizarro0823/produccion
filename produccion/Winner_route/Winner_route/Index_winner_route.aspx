<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Index_winner_route.aspx.cs" Inherits="Index_winner_route" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />


    <meta http-equiv="X-UA-Compatible" content="IE=11" />
    <link type="text/css" href="Content/bootstrap.min.css" rel="stylesheet" />
    <script src="Scripts/jquery-1.9.1.min.js"></script>
    <script src="Scripts/jquery.bootstrap-growl.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>

    <script src="ChartJS.js"></script>

    <title>Winner Route</title>

    <style>
        .jumbotron {
            padding-top: 0px;
            padding-bottom: 48px;
        }

        .scrolling-table-container {
            height: 400px;
            overflow-y: scroll;
            overflow-x: hidden;
        }

        .modal-color-green .modal-backdrop {
            background-color: #0f0;
        }

        .alert-info {
            color: black;
            background-color: #F3F781;
            border-color: white;
        }

        .headercenter {
            text-align: center !important
        }

        body {
            background: #ED213A;
            background: -webkit-linear-gradient(to right, #93291E, #ED213A);
            background: linear-gradient(to right, #93291E, #ED213A);
        }

        .navbar panel-danger {
            background: #333333;
            background: -webkit-linear-gradient(to top, #dd1818, #333333);
            background: linear-gradient(to top, #dd1818, #333333);
        }

        .alert-success {
            color: black;
            background-color: #81F781;
            border-color: white;
        }

        .panel {
            margin-bottom: 1px;
            background-color: #fff;
            border: 1px solid transparent;
            border-radius: 15px;
            -webkit-box-shadow: 0 1px 1px rgba(0,0,0,.05);
            box-shadow: 0 1px 1px rgba(0,0,0,.05);
        }

        .container {
            display: grid;
            /*grid-template-columns: repeat(5, 1fr);*/
            gap: 10px;
        }

        .box {
            border: 3px solid #666;
            background-color: #ddd;
            border-radius: .5em;
            padding: 10px;
            cursor: move;
        }

            .box.over {
                border: 3px dotted #666;
            }

        .box_drag {
            border: 3px solid #e4e4e4;
            background-color: #e4e4e4;
            border-radius: .5em;
            padding: 10px;
            cursor: move;
        }

            .box_drag.over {
                border: 3px dotted #666;
            }
    </style>

    <script type="text/javascript">
        //https://web.dev/drag-and-drop/

        document.addEventListener('DOMContentLoaded', (event) => {
            addevents();
        });

        var dragSrcEl = null;

        function handleDragStart(e) {
            this.style.opacity = '0.4';
            dragSrcEl = this;
            e.dataTransfer.effectAllowed = 'move';
            e.dataTransfer.setData('text/html', this.innerHTML);
        }

        function handleDragOver(e) {
            if (e.preventDefault) {
                e.preventDefault();
            }
            e.dataTransfer.dropEffect = 'move';
            return false;
        }

        function handleDragEnter(e) {
            this.classList.add('over');
        }

        function handleDragLeave(e) {
            this.classList.remove('over');
        }

        function handleDrop(e) {
            if (e.stopPropagation) {
                e.stopPropagation(); // stops the browser from redirecting.
            }

            if (dragSrcEl != this) {
                dragSrcEl.innerHTML = this.innerHTML;
                this.innerHTML = e.dataTransfer.getData('text/html');
            }
            return false;
        }

        function handleDragEnd(e) {
            this.style.opacity = '1';
            let items = document.querySelectorAll('.container .box_drag');
            items.forEach(function (item) {
                item.classList.remove('over');
            });
        }

        function addevents() {
            let items = document.querySelectorAll('.container .box_drag');
            items.forEach(function (item) {
                item.addEventListener('dragstart', handleDragStart, false);
                item.addEventListener('dragenter', handleDragEnter, false);
                item.addEventListener('dragover', handleDragOver, false);
                item.addEventListener('dragleave', handleDragLeave, false);
                item.addEventListener('drop', handleDrop, false);
                item.addEventListener('dragend', handleDragEnd, false);
            });
        }

    </script>


</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server"></asp:ScriptManager>
        <!----Header tittle..............-->
        <div>
            <nav class="navbar panel-danger" style="background-color: #93291E,#ED213A; border-color: #93291E; border: 1px solid transparent" id="nav">
                <a class="navbar-brand" style="color: white" href="#">Winner Route</a>

            </nav>
        </div>
        <main class="col-md-9 col-x1-8 py-md-3 pl-md-1 bd-sidebar" role="main">
            <div class="jumbotron" style="top: 100px; width: 134%">
                <%--<!--Breadacum Sub menu -->
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb justify-content-center">
                        <li class="breadcrumb-item">
                            <asp:LinkButton ID="btn_new" Text="New" runat="server" OnClick="bnt_new_registrer" />
                        </li>
                        <li class="breadcrumb-item">
                            <asp:LinkButton ID="btn_grafic" Text="Graphics" runat="server" OnClick="btn_grafic_modal" />
                        </li>
                        <li class="breadcrumb-item">
                            <asp:LinkButton ID="btn_simula" Text="Simulation" runat="server" OnClick="btn_simulacion_modal" />
                        </li>
                        <li class="breadcrumb-item">
                            <asp:LinkButton ID="btn_ediccion" Text="Edit" runat="server" OnClick="btn_simulacion_modal" />
                        </li>
                    </ol>
                </nav>--%>
                <!--FIn Breadacum -->
                <div>



                    <div class="panel panel-default" style="width: 99%; padding: 5px; margin: 5px">
                        <div id="dvTab">
                            <!-- Navigation Tabs starts -->
                            <ul class="nav nav-tabs" role="tablist">
                                <li><a href="#tab1" aria-controls="tab1" role="tab" data-toggle="tab">Home</a></li>
                                <li><a href="#tab2" aria-controls="tab2" role="tab" data-toggle="tab">Simulation</a></li>
                                <li><a href="#tab3" aria-controls="tab3" role="tab" data-toggle="tab">Suggested Route</a></li>
                                <li><a href="#tab4" aria-controls="tab4" role="tab" data-toggle="tab">Options</a></li>
                            </ul>
                            <!-- Navigation Tabs ends -->
                            <!-- Tab Panes starts -->
                            <div class="tab-content" style="padding-top: 10px">
                                <!--https://www.webcodeexpert.com/2015/10/how-to-maintain-bootstrap-selected-tab.html-->
                                <div role="tabpanel" class="tab-pane active" id="tab1">
                                    <%--TAB DE INICIO.................................................................................--%>
                                    <div class="panel">
                                        <div class="panel-body">
                                            <table>
                                                <tr>
                                                    <td>
                                                        <asp:Label Text="Reference :" runat="server" />
                                                    </td>
                                                    <td>
                                                        <asp:TextBox runat="server" ID="txt_referencia" CssClass=" form-control" />
                                                    </td>
                                                    <td>
                                                        <asp:Button Text="Consultar" OnClick="btn_onclick_fill_grw" CssClass="btn btn-success" runat="server" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="panel">
                                        <div class="panel-body">
                                            <asp:GridView ID="grid1" CssClass="table table-bordered" runat="server" AutoGenerateColumns="false">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Referencia">
                                                        <ItemTemplate>
                                                            <asp:LinkButton Text='<%# Eval("Referencia") %>' runat="server" OnClick="btn_edit_modal" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField HeaderText="Proceso" DataField="proceso" />
                                                    <asp:BoundField HeaderText="Velo" DataField="velocidad" />
                                                    <asp:BoundField HeaderText="Peso Gota" DataField="peso_gota" />
                                                    <asp:BoundField HeaderText="Anillo" DataField="anillo" />
                                                    <asp:BoundField HeaderText="ExC Aguja" DataField="ext_aguja" />
                                                    <asp:BoundField HeaderText="ExC Tijera" DataField="ext_tijera" />
                                                    <asp:BoundField HeaderText="Machos" DataField="machos" />
                                                    <asp:BoundField HeaderText="Premolde" DataField="premolde" />
                                                    <asp:BoundField HeaderText="BoQ" DataField="boquilleras" />
                                                    <asp:BoundField HeaderText="Moldes" DataField="moldes" />
                                                    <asp:BoundField HeaderText="Llevadores" DataField="llevadores" ItemStyle-Width="10%" />
                                                </Columns>
                                            </asp:GridView>
                                            <div style="margin-left: auto; margin-right: auto; text-align: center;">
                                                <div class="panel" style="background-color: gainsboro">
                                                    <asp:Label Text="En  Relación" runat="server" Font-Bold="false" Font-Size="Medium" CssClass="StrongText" />
                                                </div>
                                                <p>
                                                </p>
                                            </div>

                                            <div class="panel">
                                                <table class="table table-bordered">
                                                    <tr>
                                                        <td style="width: 85px;">
                                                            <asp:Label Text="Referencia" Font-Size="X-Small" runat="server" />
                                                        </td>
                                                        <td style="width: 85px;">
                                                            <asp:Label Text="Proceso" Font-Size="X-Small" runat="server" />
                                                        </td>
                                                        <td style="width: 86px;">
                                                            <asp:Label Text="Veloc" Font-Size="X-Small" runat="server" />
                                                        </td>
                                                        <td style="width: 86px;">
                                                            <asp:Label Text="Peso Gota" Font-Size="X-Small" runat="server" />
                                                        </td>
                                                        <td style="width: 85px;">
                                                            <asp:Label Text="Anillo" Font-Size="X-Small" runat="server" />
                                                        </td>
                                                        <td style="width: 90px;">
                                                            <asp:Label Text="Exectrica Aguja" Font-Size="X-Small" runat="server" />
                                                        </td>
                                                        <td style="width: 90px;">
                                                            <asp:Label Text="Exentrica Tijera" Font-Size="X-Small" runat="server" />
                                                        </td>
                                                        <td style="width: 98px;">
                                                            <asp:Label Text="Machos" Font-Size="X-Small" runat="server" />
                                                        </td>
                                                        <td style="width: 87px;">
                                                            <asp:Label Text="Premolde" Font-Size="X-Small" runat="server" />
                                                        </td>
                                                        <td style="width: 85px;">
                                                            <asp:Label Text="Boquilleras" Font-Size="X-Small" runat="server" />
                                                        </td>
                                                        <td style="width: 102px;">
                                                            <asp:Label Text="Moldes" Font-Size="X-Small" runat="server" />
                                                        </td>
                                                        <td style="width: 83px;">
                                                            <asp:Label Text="Llevadores" Font-Size="X-Small" runat="server" />
                                                        </td>
                                                        <td style="width: 98px;">
                                                            <asp:Label Text="%" Font-Size="X-Small" runat="server" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>

                                            <div class="scrolling-table-container">
                                                <asp:GridView ID="grid2" CssClass="table table-bordered" runat="server" ShowHeader="false" Font-Size="Small" AutoGenerateColumns="false" HeaderStyle-CssClass="FixedHeader">
                                                    <Columns>
                                                        <asp:BoundField HeaderText="Referencia" DataField="referencia">
                                                            <ItemStyle Width="100px"></ItemStyle>
                                                        </asp:BoundField>

                                                        <asp:BoundField HeaderText="Proceso" DataField="proceso">
                                                            <ItemStyle Width="100px"></ItemStyle>
                                                        </asp:BoundField>

                                                        <asp:BoundField HeaderText="Velo" DataField="velocidad">
                                                            <ItemStyle Width="100px"></ItemStyle>
                                                        </asp:BoundField>

                                                        <asp:BoundField HeaderText="Peso Gota" DataField="peso_gota">
                                                            <ItemStyle Width="100px"></ItemStyle>
                                                        </asp:BoundField>

                                                        <asp:BoundField HeaderText="Anillo" DataField="anillo">
                                                            <ItemStyle Width="100px"></ItemStyle>
                                                        </asp:BoundField>

                                                        <asp:BoundField HeaderText="ExC Aguja" DataField="ext_aguja">
                                                            <ItemStyle Width="100px"></ItemStyle>
                                                        </asp:BoundField>

                                                        <asp:BoundField HeaderText="ExC Tijera" DataField="ext_tijera">
                                                            <ItemStyle Width="100px"></ItemStyle>
                                                        </asp:BoundField>

                                                        <asp:BoundField HeaderText="Machos" DataField="machos">
                                                            <ItemStyle Width="100px"></ItemStyle>
                                                        </asp:BoundField>

                                                        <asp:BoundField HeaderText="Premolde" DataField="premolde">
                                                            <ItemStyle Width="100px"></ItemStyle>
                                                        </asp:BoundField>

                                                        <asp:BoundField HeaderText="BoQ" DataField="boquilleras">
                                                            <ItemStyle Width="100px"></ItemStyle>
                                                        </asp:BoundField>

                                                        <asp:BoundField HeaderText="Moldes" DataField="moldes">
                                                            <ItemStyle Width="100px"></ItemStyle>
                                                        </asp:BoundField>

                                                        <asp:BoundField HeaderText="Llevadores" DataField="llevadores">
                                                            <ItemStyle Width="100px"></ItemStyle>
                                                        </asp:BoundField>

                                                        <asp:BoundField HeaderText="%" DataField="c" ItemStyle-Width="10%" ItemStyle-Height="2em" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="headercenter">
                                                            <ItemStyle Width="100px"></ItemStyle>
                                                        </asp:BoundField>
                                                    </Columns>
                                                </asp:GridView>
                                            </div>
                                        </div>
                                    </div>
                                </div>


                                <div role="tabpanel" class="tab-pane" id="tab2">
                                    <%--TAB DE SIMULACIONES.................................................................................--%>


                                    <asp:UpdatePanel runat="server">
                                        <ContentTemplate>
                                            <div class="panel">
                                                <table>
                                                    <tr>
                                                        <td>
                                                            <asp:Label Text="Reference Simulation:" runat="server" />
                                                        </td>
                                                        <td>
                                                            <asp:TextBox runat="server" ID="Txt_simular_referencia" onkeypress="if (event.keyCode==13) return false;" CssClass=" form-control" />
                                                        </td>
                                                        <td>
                                                            <asp:Button ID="btnaddmold" Text="(+)" OnClick="btn_agregar_refer_simula" CssClass="btn btn-success" runat="server" />
                                                            <asp:Button ID="Button1" Text="Limpiar Simulación" OnClick="Button1_Click" CssClass="btn btn-danger" runat="server" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                            

                                            <div class="">
                                                <table class="table table-bordered" style="margin: 50px auto; width:86%; top:27%;position:relative " >
                                                    <tr>
                                                        <td style="width: 112px;">
                                                            <asp:Label Text="Referencia" Font-Size="Medium" runat="server" />
                                                        </td>
                                                        <td style="width: 93px;">
                                                            <asp:Label Text="Proceso" Font-Size="Medium" runat="server" />
                                                        </td>
                                                        <td style="width: 86px;">
                                                            <asp:Label Text="Veloc" Font-Size="Medium" runat="server" />
                                                        </td>
                                                        <td style="width: 86px;">
                                                            <asp:Label Text="Peso Gota" Font-Size="Medium" runat="server" />
                                                        </td>
                                                        <td style="width: 85px;">
                                                            <asp:Label Text="Anillo" Font-Size="Medium" runat="server" />
                                                        </td>
                                                        <td style="width: 90px;">
                                                            <asp:Label Text="Exectrica Aguja" Font-Size="Medium" runat="server" />
                                                        </td>
                                                        <td style="width: 90px;">
                                                            <asp:Label Text="Exentrica Tijera" Font-Size="Medium" runat="server" />
                                                        </td>
                                                        <td style="width: 98px;">
                                                            <asp:Label Text="Machos" Font-Size="Medium" runat="server" />
                                                        </td>
                                                        <td style="width: 87px;">
                                                            <asp:Label Text="Premolde" Font-Size="Medium" runat="server" />
                                                        </td>
                                                        <td style="width: 85px;">
                                                            <asp:Label Text="Boquilleras" Font-Size="Medium" runat="server" />
                                                        </td>
                                                        <td style="width: 102px;">
                                                            <asp:Label Text="Moldes" Font-Size="Medium" runat="server" />
                                                        </td>
                                                        <td style="width: 83px;">
                                                            <asp:Label Text="Llevadores" Font-Size="Medium" runat="server" />
                                                        </td>
                                                        <td style="width: 98px;">
                                                            <asp:Label Text="%" Font-Size="Medium" runat="server" />
                                                        </td>
                                                    </tr>
                                                </table>
                                                 <div class="container" id="divcont" runat="server">
                                            </div>
                                            </div>

                                           
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="btnaddmold" EventName="Click" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </div>




                                <div role="tabpanel" class="tab-pane" id="tab4">
                                    <%--TAB DE OPCIONES.................................................................................--%>
                                    <div class="panel panel-default" style="width: 100%; padding: 5px; margin: 0px">
                                        <div id="dvTab2">
                                            <!-- Navigation Tabs starts -->
                                            <ul class="nav nav-tabs" role="tablist">
                                                <li><a href="#tab_edit_1" aria-controls="tab1" role="tab" data-toggle="tab">Crear</a></li>
                                                <li><a href="#tab_edit_2" aria-controls="tab2" role="tab" data-toggle="tab">Editar</a></li>
                                                <li><a href="#tab_edit_3" aria-controls="tab3" role="tab" data-toggle="tab">Eliminar</a></li>
                                            </ul>
                                            <!-- Navigation Tabs ends -->
                                            <!-- Tab Panes starts -->
                                            <div class="tab-content" style="padding-top: 10px">
                                                <div role="tabpanel" class="tab-pane active" id="tab_edit_1">
                                                    <%--TAB DE OPCIONES///CREATE...........................................--%>
                                                    <h3>Crear Nueva Referencia</h3>
                                                    <p>
                                                    </p>
                                                    <table class="table table-striped">
                                                        <tr>
                                                            <td>
                                                                <asp:Label Text="Referencia " runat="server" />
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="txt_create_referencia" runat="server" MaxLength="10" CssClass="form-control" Width="400" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:Label Text="Proceso" runat="server" />
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="txt_create_proceso" runat="server" MaxLength="10" CssClass="form-control" Width="400" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:Label Text="Velocidad" runat="server" />
                                                            </td>
                                                            <td>
                                                                <asp:TextBox runat="server" ID="txt_create_velocidad" MaxLength="5" CssClass="form-control" Width="400" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:Label Text="Peso Gota" runat="server" />
                                                            </td>
                                                            <td>
                                                                <asp:TextBox runat="server" ID="txt_create_peso_gota" MaxLength="5" CssClass="form-control" Width="400" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:Label Text="Anillo" runat="server" />
                                                            </td>
                                                            <td>
                                                                <asp:TextBox runat="server" ID="txt_create_anillo" MaxLength="5" CssClass="form-control" Width="400" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:Label Text="Extraccion Aguja" runat="server" />
                                                            </td>
                                                            <td>
                                                                <asp:TextBox runat="server" ID="txt_create_extr_aguja" MaxLength="5" CssClass="form-control" Width="400" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:Label Text="Extracion Tijera" runat="server" />
                                                            </td>
                                                            <td>
                                                                <asp:TextBox runat="server" ID="txt_create_ext_tijera" MaxLength="5" CssClass="form-control" Width="400" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:Label Text="Machos" runat="server" />
                                                            </td>
                                                            <td>
                                                                <asp:TextBox runat="server" ID="txt_create_machos" MaxLength="5" CssClass="form-control" Width="400" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:Label Text="Premolde" runat="server" />
                                                            </td>
                                                            <td>
                                                                <asp:TextBox runat="server" ID="txt_create_premolde" MaxLength="10" CssClass="form-control" Width="400" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:Label Text="Boquilleras" runat="server" />
                                                            </td>
                                                            <td>
                                                                <asp:TextBox runat="server" ID="txt_create_boquilleras" MaxLength="5" CssClass="form-control" Width="400" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:Label Text="Moldes" runat="server" />
                                                            </td>
                                                            <td>
                                                                <asp:TextBox runat="server" ID="txt_create_moldes" MaxLength="10" CssClass="form-control" Width="400" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:Label Text="Llevadores" runat="server" />
                                                            </td>
                                                            <td>
                                                                <asp:TextBox runat="server" ID="txt_create_llevadores" MaxLength="5" CssClass="form-control" Width="400" />
                                                            </td>
                                                        </tr>
                                                    </table>

                                                    <div>
                                                        <asp:Button Text="Registar Referencia" MaxLength="10" CssClass="btn btn-success" runat="server" />
                                                    </div>
                                                </div>
                                                <div role="tabpanel" class="tab-pane" id="tab_edit_2">
                                                    <%--TAB DE OPCIONES///UPDATE..................................................--%>
                                                    <h3>Editar Referencia</h3>
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                <asp:TextBox ID="txt_buscar_options" runat="server" CssClass="form-control" Width="300" />
                                                            </td>
                                                            <td>
                                                                <asp:Button Text="Buscar" CssClass="btn btn-success" OnClick="btn_buscar_options" runat="server" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <p></p>
                                                    <asp:GridView ID="griv_editar" CssClass="table table-bordered" AutoGenerateColumns="false" runat="server">
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="Referencia">
                                                                <ItemTemplate>
                                                                    <asp:LinkButton Text='<%# Eval("Referencia") %>' runat="server" OnClick="btn_edit_modal" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:BoundField HeaderText="Proceso" DataField="proceso" />
                                                            <asp:BoundField HeaderText="Velo" DataField="velocidad" />
                                                            <asp:BoundField HeaderText="Peso Gota" DataField="peso_gota" />
                                                            <asp:BoundField HeaderText="Anillo" DataField="anillo" />
                                                            <asp:BoundField HeaderText="ExC Aguja" DataField="ext_aguja" />
                                                            <asp:BoundField HeaderText="ExC Tijera" DataField="ext_tijera" />
                                                            <asp:BoundField HeaderText="Machos" DataField="machos" />
                                                            <asp:BoundField HeaderText="Premolde" DataField="premolde" />
                                                            <asp:BoundField HeaderText="BoQ" DataField="boquilleras" />
                                                            <asp:BoundField HeaderText="Moldes" DataField="moldes" />
                                                            <asp:BoundField HeaderText="Llevadores" DataField="llevadores" />
                                                        </Columns>
                                                    </asp:GridView>
                                                </div>
                                                <div role="tabpanel" class="tab-pane" id="tab_edit_3">
                                                    <%--TAB DE OPCIONES///DELETE..................................................--%>
                                                    <asp:Button Text="g" runat="server" />
                                                </div>
                                            </div>
                                            <!-- Tab Panes ends -->
                                        </div>
                                        <br />
                                        <asp:HiddenField ID="HiddenField1" runat="server" />
                                    </div>
                                </div>
                            </div>
                            <!-- Tab Panes ends -->
                        </div>
                        <br />
                        <asp:HiddenField ID="hfTab" runat="server" />
                    </div>




                </div>
            </div>

            <!-- Modal content Graficos.........  .....................................................................................................................................-->
            <div style="width: 100%" class="modal fade" id="myModal4" role="dialog">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4>Route Graphics</h4>
                        </div>
                        <div class="panel" id="panel4">
                            <asp:Literal ID="ltChart" runat="server"></asp:Literal>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                        </div>
                    </div>

                </div>
            </div>
            <!-- Modal content Simulacion.................................................................................................................................................-->
            <div style="width: 100%" class="modal fade" id="myModal5" role="dialog">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4>Route Graphics</h4>
                        </div>
                        <div class="panel" id="panel5">
                            <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                        </div>
                    </div>

                </div>
            </div>
            <!-- Modal content Editar Referencia.....................................................................................................................................-->
            <div style="width: 100%" class="modal fade" id="myModal6" role="dialog">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4>Editar</h4>
                            <asp:Label runat="server" ID="Label1" Visible="true"></asp:Label>
                        </div>
                        <div class="panel" id="panel6">
                            <table class="table table-striped">
                                <tr>
                                    <td>
                                        <label>
                                            Proceso
                                        </label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_proceso_edit" runat="server" onkeypress="if (event.keyCode==13) return false;" CssClass="form-control" Width="200" />
                                    </td>

                                    <td>
                                        <label>
                                            Velocidad
                                        </label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_veloc_edit" runat="server" onkeypress="if (event.keyCode==13) return false;" CssClass="form-control" Width="200" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>
                                            Peso Gota
                                        </label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_peso_gota_edit" runat="server" onkeypress="if (event.keyCode==13) return false;" CssClass="form-control" Width="200" />
                                    </td>

                                    <td>
                                        <label>
                                            Anillo
                                        </label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_anillo_edit" runat="server" onkeypress="if (event.keyCode==13) return false;" CssClass="form-control" Width="200" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>
                                            ExC Aguja
                                        </label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_exc_aguja_edit" runat="server" onkeypress="if (event.keyCode==13) return false;" CssClass="form-control" Width="200" />
                                    </td>
                                    <td>
                                        <label>
                                            ExC Tijeras
                                        </label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_exc_tijera_edit" runat="server" onkeypress="if (event.keyCode==13) return false;" CssClass="form-control" Width="200" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>
                                            Machos
                                        </label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_machos_edit" runat="server" onkeypress="if (event.keyCode==13) return false;" CssClass="form-control" Width="200" />
                                    </td>
                                    <td>
                                        <label>
                                            Premolde
                                        </label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_premolde_edit" runat="server" onkeypress="if (event.keyCode==13) return false;" CssClass="form-control" Width="200" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>
                                            Boquilleras
                                        </label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_boquilleras_edit" runat="server" onkeypress="if (event.keyCode==13) return false;" CssClass="form-control" Width="200" />
                                    </td>
                                    <td>
                                        <label>
                                            Moldes
                                        </label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_moldes_edit" runat="server" onkeypress="if (event.keyCode==13) return false;" CssClass="form-control" Width="200" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>
                                            Llevadores
                                        </label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_llevadores_edit" runat="server" onkeypress="if (event.keyCode==13) return false;" CssClass="form-control" Width="200" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="modal-footer">

                            <div class="container">
                                <div class="row">
                                    <div class="col-md-3 col-sm-6 col-xs-1 text-left">
                                        <asp:Button Text="Elminar Registro" ID="btn_eliminar" CssClass="btn btn-danger" OnClick="btn_eliminar_Click" runat="server" />
                                    </div>
                                    <div class="col-ms- col-sm-6 col-xs-6 text-right">
                                        <asp:Button Text="Actualizar" CssClass="btn btn-success" OnClick="btn_actualizar_tbl_winer_route" runat="server" />
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <!-- Modal Eliminacion........................................................................................................................................................-->
            <div style="width: 100%" class="modal fade" id="myModal7" role="dialog">
                <div class="modal-dialog modal-sm">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4>Se eliminara registro Desea Continuar ?</h4>
                        </div>
                        <div class="modal-footer">
                            <asp:Button Text="Si" ID="btn_yes_conditional_modal" OnClick="btn_eliminar_Click" CssClass="btn btn-success" runat="server" Width="120" />
                            <asp:Button Text="No" ID="btn_no_conditional_modal" CssClass="btn btn-danger" runat="server" Width="120" />
                        </div>
                    </div>

                </div>
            </div>
        </main>
    </form>
</body>
</html>
