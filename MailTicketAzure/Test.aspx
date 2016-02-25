<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Test.aspx.cs" Inherits="MailTicketAzure.Test" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <asp:ListView ID="ListView1" runat="server">
            <ItemTemplate>
                <div class="thumbnail">
                <div class="row">
                        <div class="col-md-4">
                        </div>
                        <div class="col-md-8">
                            <div class="caption">
                                <h2><%# Eval("IdTitolo") %></h2>
                                <p><%# Eval("ordine_posto") %></p>
                                <p><%# Eval("PrezzoTitolo") %></p>
                            </div>
                        </div>
                    </div>
                </div><br /><br />
            </ItemTemplate>
        </asp:ListView>
                          <ol>
                              <li>
                                Messaggio: <asp:Label ID="Label1" runat="server"></asp:Label>
                              </li>
                              <li>
                                Esito: <asp:Label ID="Label2" runat="server"></asp:Label>
                              </li>
                              <li>
                                Numero ordine: <asp:Label ID="Label3" runat="server"></asp:label>
                              </li>
                              <li>
                                Numero riga: <asp:Label ID="Label4" runat="server"></asp:Label>
                              </li>
                          </ol> 

</asp:Content>
