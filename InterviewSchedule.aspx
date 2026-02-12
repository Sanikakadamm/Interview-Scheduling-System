<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InterviewSchedule.aspx.cs" Inherits="InterviewSchedule.InterviewSchedule" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Interview Schedule</title>
</head>

<body class="bg-light">

<form id="form1" runat="server">

    <!-- Center container -->
    <div class="container mt-5 d-flex justify-content-center">

        <!-- Card -->
        <div class="card shadow-lg p-4" style="width: 450px;">

            <h4 class="text-center mb-4">Job Application Form</h4>


            <!-- Stream -->
            <div class="mb-3">
                <label class="form-label">Select Stream</label>
                <asp:DropDownList
                    ID="ddlStream"
                    runat="server"
                    CssClass="form-select"
                    AutoPostBack="true"
                    OnSelectedIndexChanged="ddlStream_SelectedIndexChanged">

                    
                    <asp:ListItem Text="BCA" />
                    <asp:ListItem Text="BCS" />
                    <asp:ListItem Text="BSC IT" />
                    <asp:ListItem Text="BE" />
                    <asp:ListItem Text="MCA" />
                    <asp:ListItem Text="Other" />

                </asp:DropDownList>
            </div>


            <!-- Candidate Type -->
            <div class="mb-3">
    <label class="form-label d-block">Are You</label>

    <asp:RadioButtonList
        ID="rblType"
        runat="server"
        RepeatDirection="Horizontal"
        RepeatLayout="Flow"
        CssClass="d-flex gap-4"
        AutoPostBack="true"
        OnSelectedIndexChanged="rblType_SelectedIndexChanged">

        <asp:ListItem Text="Fresher" Value="Fresher" />
        <asp:ListItem Text="Experienced" Value="Experienced" />

    </asp:RadioButtonList>
</div>



            <!-- Name -->
            <div class="mb-3">
                <label class="form-label">Name</label>
                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" />
            </div>


            <!-- Contact -->
            <div class="mb-3">
                <label class="form-label">Contact</label>
                <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" />
            </div>


            <!-- Email -->
            <div class="mb-3">
                <label class="form-label">Email</label>
                <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" />
            </div>


            <!-- Experienced Fields -->
            <asp:Panel ID="pnlExp" runat="server">
                <div class="mb-3">
                    <label class="form-label">CTC</label>
                    <asp:TextBox ID="txtCTC" runat="server" CssClass="form-control" />
                </div>

                <div class="mb-3">
                    <label class="form-label">ECTC</label>
                    <asp:TextBox ID="txtECTC" runat="server" CssClass="form-control" />
                </div>

                <div class="mb-3">
                    <label class="form-label">Notice Period</label>
                    <asp:TextBox ID="txtNotice" runat="server" CssClass="form-control" />
                </div>

            </asp:Panel>


            <!-- Resume -->
            <div class="mb-4">
                <label class="form-label">Upload Resume</label>
                <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control" />
            </div>


            <!-- Submit -->
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
