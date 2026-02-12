using System;
using System.Web.UI;

namespace InterviewSchedule
{
    public partial class InterviewSchedule : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // when page loads first time, disable experienced fields
            if (!IsPostBack)
            {
                txtCTC.Enabled = false;
                txtECTC.Enabled = false;
                txtNotice.Enabled = false;
            }
        }


        // when stream changes
        protected void ddlStream_SelectedIndexChanged(object sender, EventArgs e)
        {
            // if other selected, candidate not eligible
            if (ddlStream.SelectedValue == "Other")
            {
                Button1.Enabled = false;
            }
            else
            {
                Button1.Enabled = true;
            }
        }


        // when fresher/experienced selected
        protected void rblType_SelectedIndexChanged(object sender, EventArgs e)
        {
            // check which radio selected
            if (rblType.SelectedValue == "Experienced")
            {
                txtCTC.Enabled = true;
                txtECTC.Enabled = true;
                txtNotice.Enabled = true;
            }
            else
            {
                txtCTC.Enabled = false;
                txtECTC.Enabled = false;
                txtNotice.Enabled = false;
            }
        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            // if fresher, go to slot booking page
            if (rblType.SelectedValue == "Fresher")
            {
                Response.Redirect("SlotBooking.aspx");
            }
            else
            {
                // experienced logic will come here later
                // like email sending or saving data
            }
        }
    }
}
