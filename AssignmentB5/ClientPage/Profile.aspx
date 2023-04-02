﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/ClientMaster.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="AssignmentB5.ClientPage.Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .display-i, .btn-hide {
            display: none;
        }

        .form-control {
            background: white;
        }

            .form-control:focus {
                background: white;
                color: black;
            }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container my-3">
        <div class="row">
            <div class="container py-5">
                <div class="card mb-4">
                    <div class="row">
                        <div class="col-4">
                            <div class="card-body text-center">
                                <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava3.webp" alt="avatar"
                                    class="rounded-circle img-fluid" style="width: 150px;">
                                <h5 class="my-3">John Smith</h5>
                                <button id="btnEditProf" class="btn btn-primary" type="button">Edit Profile</button>
                            </div>
                        </div>
                        <div class="col-8">
                            <div class="my-auto">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <p class="mb-0">Full Name</p>
                                        </div>
                                        <div class="col-sm-9">
                                            <p class="text-muted mb-0">Johnatan Smith</p>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <p class="mb-0">Email</p>
                                        </div>
                                        <div class="col-sm-9">
                                            <p class="text-muted mb-0">example@example.com</p>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <p class="mb-0">Phone</p>
                                        </div>
                                        <div class="col-sm-9">
                                            <p class="text-muted mb-0 display-t">(097) 234-5678</p>
                                            <asp:TextBox ID="txtPhone" CssClass="form-control display-i" runat="server" TextMode="Phone"></asp:TextBox>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <p class="mb-0">Address</p>
                                        </div>
                                        <div class="col-sm-9">
                                            <p class="text-muted mb-0 display-t d-none">Bay Area, San Francisco, CA</p>
                                            <asp:TextBox ID="txtAddress" CssClass="form-control display-i" runat="server"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="row d-flex mt-5 justify-content-center">
                                        <button id="btnCancel" class="btn btn-primary w-25 mx-2 btn-hide" type="button">Cancel</button>
                                        <button id="btnSave" class="btn btn-primary w-25 mx-2 btn-hide" type="button">Save</button>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <div class="container container-sm container-md container-lg container-xl my-3">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT * FROM [Orders] WHERE ([username] = @username)">
            <SelectParameters>
                <asp:Parameter DefaultValue="jess0119" Name="username" Type="String"></asp:Parameter>
            </SelectParameters>
        </asp:SqlDataSource>
        <div class="table-responsive">
            <asp:GridView ID="GridView1" CssClass="table table-bordered table-hover text-center" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="SqlDataSource1" GridLines="Vertical" HorizontalAlign="Center" AutoGenerateColumns="False" PageSize="5" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="orderId" HeaderText="Order Id" SortExpression="orderId"></asp:BoundField>
                    <asp:BoundField DataField="orderDate" HeaderText="Date" SortExpression="orderDate" DataFormatString="{0:dd/MM/yyyy}"></asp:BoundField>
                    <asp:BoundField DataField="grandTotal" HeaderText="Total(RM)" SortExpression="grandTotal"></asp:BoundField>
                    <asp:BoundField DataField="prodTotalQty" HeaderText="Qty" SortExpression="prodTotalQty"></asp:BoundField>
                    <asp:BoundField DataField="shipmentAddress" HeaderText="Address" SortExpression="shipmentAddress"></asp:BoundField>
                    <asp:BoundField DataField="paymentId" HeaderText="Payment Id" SortExpression="paymentId"></asp:BoundField>
                    <asp:CommandField ButtonType="Button" ControlStyle-CssClass="btn btn-primary" SelectText="View" ShowSelectButton="True" HeaderText="Action"></asp:CommandField>
                </Columns>
                <HeaderStyle HorizontalAlign="Center" />
            </asp:GridView>
        </div>
        <br />
    </div>
    <script type="text/javascript">
        var btnEditProf = document.getElementById('btnEditProf');
        var btnCancel = document.getElementById('btnCancel');
        var btnSave = document.getElementById('btnSave');
        var allTextOnly = document.getElementsByClassName('display-t');
        var allInput = document.getElementsByClassName('display-i');
        var editing = false;

        btnEditProf.addEventListener('click', function () {
            Array.from(allTextOnly).forEach((el) => {
                el.style.display = "none";
            });

            Array.from(allInput).forEach((el) => {
                el.style.display = "block";
            });


            btnEditProf.style.display = "none";
            btnCancel.style.display = "inline-block";
            btnSave.style.display = "inline-block";
            editing = !editing;
        });


        btnCancel.addEventListener('click', function () {

            Array.from(allTextOnly).forEach((el) => {
                el.style.display = "block";
            });

            Array.from(allInput).forEach((el) => {
                el.style.display = "none";
            });

            btnEditProf.style.display = "inline-block";
            btnCancel.style.display = "none";
            btnSave.style.display = "none";
            editing = !editing;
        });


    </script>
</asp:Content>
