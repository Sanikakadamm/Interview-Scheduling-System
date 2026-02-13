using System;
using System.Data.SqlClient;
using System.IO;
using System.Configuration;
using System.Web.UI;

namespace InterviewSchedule
{
    public partial class InterviewSchedule : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
                txtCTC.Enabled = false;
                txtECTC.Enabled = false;
                txtNotice.Enabled = false;
            }
        }

        protected void ddlStream_SelectedIndexChanged(object sender, EventArgs e)
        {
            
            if (ddlStream.SelectedValue == "Other")
            {
                Button1.Enabled = false;
            }
            else
            {
                Button1.Enabled = true;
            }
        }

        protected void rblType_SelectedIndexChanged(object sender, EventArgs e)
        {
            
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
            string name = TextBox1.Text.Trim();
            string contact = TextBox2.Text.Trim();
            string email = TextBox3.Text.Trim();
            string stream = ddlStream.SelectedValue;
            string type = rblType.SelectedValue;

            
            string ctc = (type == "Experienced") ? txtCTC.Text.Trim() : null;
            string ectc = (type == "Experienced") ? txtECTC.Text.Trim() : null;
            string notice = (type == "Experienced") ? txtNotice.Text.Trim() : null;

            
            string resumePath = "";
            if (FileUpload1.HasFile)
            {
                string uploadFolder = Server.MapPath("~/Uploads/");
                if (!Directory.Exists(uploadFolder))
                {
                    Directory.CreateDirectory(uploadFolder);
                }
                resumePath = Path.Combine(uploadFolder, Path.GetFileName(FileUpload1.FileName));
                FileUpload1.SaveAs(resumePath);
            }

            
            string cs = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = @"INSERT INTO CandidateApplications
                                (Name, Contact, Email, Stream, Type, CTC, ECTC, NoticePeriod, ResumePath)
                                VALUES
                                (@Name, @Contact, @Email, @Stream, @Type, @CTC, @ECTC, @NoticePeriod, @ResumePath)";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Name", name);
                    cmd.Parameters.AddWithValue("@Contact", contact);
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@Stream", stream);
                    cmd.Parameters.AddWithValue("@Type", type);
                    cmd.Parameters.AddWithValue("@CTC", (object)ctc ?? DBNull.Value);
                    cmd.Parameters.AddWithValue("@ECTC", (object)ectc ?? DBNull.Value);
                    cmd.Parameters.AddWithValue("@NoticePeriod", (object)notice ?? DBNull.Value);
                    cmd.Parameters.AddWithValue("@ResumePath", resumePath);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }

            
            if (type == "Fresher")
            {
                Response.Redirect("SlotBooking.aspx");
            }
            else
            {
                //   Experienced logic here (send email to HR)
                Response.Write("<script>alert('Experienced candidate details saved successfully!');</script>");
            }
        }
    }
}
