<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InterviewSchedule.aspx.cs"
    Inherits="InterviewSchedule.InterviewSchedule"
    UnobtrusiveValidationMode="None" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Interview Schedule</title>
</head>

<body class="bg-light">

<form id="form1" runat="server">

    
    <div class="container mt-5 d-flex justify-content-center">

        
        <div class="card shadow-lg p-4" style="width:450px;">

            <h4 class="text-center mb-4">Job Application Form</h4>


            
            <div class="mb-3">
                <label class="form-label">Select Stream</label>

                <asp:DropDownList
                    ID="ddlStream"
                    runat="server"
                    CssClass="form-select"
                    AutoPostBack="true"
                    OnSelectedIndexChanged="ddlStream_SelectedIndexChanged">

                    <asp:ListItem Text="-- Select --" Value="" />
                    <asp:ListItem Text="BCA" />
                    <asp:ListItem Text="BCS" />
                    <asp:ListItem Text="BSC IT" />
                    <asp:ListItem Text="BE" />
                    <asp:ListItem Text="MCA" />
                    <asp:ListItem Text="Other" />
                </asp:DropDownList>

                <asp:RequiredFieldValidator
                    ControlToValidate="ddlStream"
                    InitialValue=""
                    ErrorMessage="Select stream"
                    ForeColor="Red"
                    runat="server" />
            </div>



            
            <div class="mb-3">
                <label class="form-label d-block">Are You</label>

                <asp:RadioButtonList
                    ID="rblType"
                    runat="server"
                    RepeatDirection="Horizontal"
                    CssClass="d-flex gap-4"
                    AutoPostBack="true"
                    OnSelectedIndexChanged="rblType_SelectedIndexChanged">

                    <asp:ListItem Text="Fresher" Value="Fresher" />
                    <asp:ListItem Text="Experienced" Value="Experienced" />
                </asp:RadioButtonList>
            </div>



            
            <div class="mb-3">
                <label class="form-label">Name</label>
                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" />

                <asp:RequiredFieldValidator
                    ControlToValidate="TextBox1"
                    ErrorMessage="Name required"
                    ForeColor="Red"
                    runat="server" />
            </div>



            <div class="mb-3">
                <label class="form-label">Contact</label>
                <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" />

                <asp:RequiredFieldValidator
                    ControlToValidate="TextBox2"
                    ErrorMessage="Contact required"
                    ForeColor="Red"
                    runat="server" />

                <asp:RegularExpressionValidator
                    ControlToValidate="TextBox2"
                    ValidationExpression="^[0-9]{10}$"
                    ErrorMessage="Enter 10 digit number"
                    ForeColor="Red"
                    runat="server" />
            </div>



            
            <div class="mb-3">
                <label class="form-label">Email</label>
                <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" />

                <asp:RequiredFieldValidator
                    ControlToValidate="TextBox3"
                    ErrorMessage="Email required"
                    ForeColor="Red"
                    runat="server" />

                <asp:RegularExpressionValidator
                    ControlToValidate="TextBox3"
                    ValidationExpression="^\w+([.-]?\w+)*@\w+([.-]?\w+)*(\.\w{2,3})+$"
                    ErrorMessage="Invalid email"
                    ForeColor="Red"
                    runat="server" />
            </div>



            
            <asp:Panel ID="pnlExp" runat="server">


                <div class="mb-3">
                    <label class="form-label">CTC</label>
                    <asp:TextBox ID="txtCTC" runat="server" CssClass="form-control" />

                    <asp:RequiredFieldValidator
                        ID="valCTC"
                        ControlToValidate="txtCTC"
                        ErrorMessage="CTC required"
                        Enabled="false"
                        ForeColor="Red"
                        runat="server" />
                </div>


                <div class="mb-3">
                    <label class="form-label">ECTC</label>
                    <asp:TextBox ID="txtECTC" runat="server" CssClass="form-control" />

                    <asp:RequiredFieldValidator
                        ID="valECTC"
                        ControlToValidate="txtECTC"
                        ErrorMessage="ECTC required"
                        Enabled="false"
                        ForeColor="Red"
                        runat="server" />
                </div>


                <div class="mb-3">
                    <label class="form-label">Notice Period</label>
                    <asp:TextBox ID="txtNotice" runat="server" CssClass="form-control" />

                    <asp:RequiredFieldValidator
                        ID="valNotice"
                        ControlToValidate="txtNotice"
                        ErrorMessage="Notice period required"
                        Enabled="false"
                        ForeColor="Red"
                        runat="server" />
                </div>

            </asp:Panel>



            
            <div class="mb-4">
                <label class="form-label">Upload Resume</label>
                <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control" />

                <asp:RequiredFieldValidator
                    ControlToValidate="FileUpload1"
                    InitialValue=""
                    ErrorMessage="Resume required"
                    ForeColor="Red"
                    runat="server" />
            </div>



           
            <asp:Button
                ID="Button1"
                runat="server"
                Text="Submit"
                CssClass="btn btn-primary w-100"
                OnClick="Button1_Click" />

        </div>
    </div>

</form>
</body>
</html>
