<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="MailTicketAzure._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
<%---Pannello anonimous ---%>
    <asp:Panel ID="pnlAnonimo" runat="server">
    <div class="row">
        <div class="col-md-8">
            <section id="loginForm">
                <div class="form-horizontal">
                    <h2>Benvenuto nel sistema di prevendita di <span class=txt-logo>MailTicket</span></h2>
                    <h4>Utilizza l'account che ti è stato assegnato per eseguire l'accesso.</h4>
                    <hr />
                    <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                        <p class="text-danger">
                            <asp:Literal runat="server" ID="FailureText" />
                        </p>
                    </asp:PlaceHolder>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-md-2 control-label">Posta elettronica</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                                CssClass="text-danger" ErrorMessage="Il campo Posta elettronica è obbligatorio." />
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label">Password</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" CssClass="text-danger" ErrorMessage="Il campo Password è obbligatorio." />
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                            <div class="checkbox">
                                <asp:CheckBox runat="server" ID="RememberMe" />
                                <asp:Label runat="server" AssociatedControlID="RememberMe">Memorizza account</asp:Label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                            <asp:Button runat="server" OnClick="LogIn" Text="Accedi" CssClass="btn btn-default" />
                        </div>
                    </div>
                </div>
                <p>
                    <a href="#NOGO">Password dimenticata</a><br />
                    <a href="#nogo">Problemi di accesso</a>
                </p>
                <p>
                    <%-- Abilitare questa opzione dopo aver abilitato la conferma dell'account per la funzionalità di reimpostazione della password
                    <asp:HyperLink runat="server" ID="ForgotPasswordHyperLink" ViewStateMode="Disabled">Password dimenticata?</asp:HyperLink>
                    --%>
                </p>
            </section>
        </div>

    </div>

    </asp:Panel>
<%---Pannello utente ---%>
    <asp:Panel ID="pnlUtente" runat="server">
        <asp:ListView ID="ListView1" runat="server">
            <ItemTemplate>
                <div class="thumbnail">
                <div class="row">
                        <div class="col-md-4">
                            <img src="Content/Images/demo3.jpg" alt="<%# Eval("LinkImmagine") %>">
                        </div>
                        <div class="col-md-8">
                            <div class="caption">
                                <h2>Spettacolo: <%# Eval("Spettacolo") %></h2>
                                <h3>IdMan<%# Eval("IdMan") %></h3>
                                <p><%# Eval("Dataevento") %></p>
                                <p><%# Eval("Location") %> Descrizione: <%# Eval("DescEvento") %></p>
                                <p><a href="#" class="btn btn-primary" role="button">Assegna</a> <a href="#" class="btn btn-default" role="button">Modifica</a></p>
                            </div>

                        </div>
                    </div>
                </div><br /><br />
            </ItemTemplate>
        </asp:ListView>
   </asp:Panel>
<%---Pannello admin ---%>
    <asp:Panel ID="pnlAdmin" runat="server">
        <asp:ListView ID="ListView2" runat="server">
            <ItemTemplate>
                <div class="thumbnail">
                <div class="row">
                        <div class="col-md-4">
                            <img src="Content/Images/demo3.jpg" alt="<%# Eval("LinkImmagine") %>">
                        </div>
                        <div class="col-md-8">
                            <div class="caption">
                                <h2><%# Eval("Spettacolo") %></h2>
                                <h3>IdMan<%# Eval("IdMan") %></h3>
                                <p><%# Eval("Dataevento") %></p>
                                <p><%# Eval("Location") %></p>
                                <p><a href="#" class="btn btn-primary" role="button">Assegna</a> <a href="#" class="btn btn-default" role="button">Modifica</a></p>
                            </div>

                        </div>
                    </div>
                </div><br /><br />
            </ItemTemplate>
        </asp:ListView>


        <div class="row">
          <div class="col-sm-6 col-md-4">
            <div class="thumbnail">
              <img src="Content/Images/demo3.jpg" alt="...">
              <div class="caption">
                <h3>Primo spettacolo</h3>
                <p>...</p>
                <p><a href="#" class="btn btn-primary" role="button">Assegna</a> <a href="#" class="btn btn-default" role="button">Modifica</a></p>
              </div>
            </div>
          </div>
          <div class="col-sm-6 col-md-4">
            <div class="thumbnail">
              <img src="Content/Images/demo3.jpg" alt="...">
              <div class="caption">
                <h3>Secondo spettacolo</h3>
                <p>...</p>
                <p><a href="#" class="btn btn-primary" role="button">Assegna</a> <a href="#" class="btn btn-default" role="button">Modifica</a></p>
              </div>
            </div>
          </div>
          <div class="col-sm-6 col-md-4">
            <div class="thumbnail">
              <img src="Content/Images/demo3.jpg" alt="...">
              <div class="caption">
                <h3>Terzo spettacolol</h3>
                <p>...</p>
                <p><a href="#" class="btn btn-primary" role="button">Assegna</a> <a href="#" class="btn btn-default" role="button">Modifica</a></p>
              </div>
            </div>
          </div>
          <div class="col-sm-6 col-md-4">
            <div class="thumbnail">
              <img src="Content/Images/demo3.jpg" alt="...">
              <div class="caption">
                <h3>Quarto spettacolo</h3>
                <p>...</p>
                <p><a href="#" class="btn btn-primary" role="button">Assegna</a> <a href="#" class="btn btn-default" role="button">Modifica</a></p>
              </div>
            </div>
          </div>
        </div>
   </asp:Panel>

</asp:Content>
