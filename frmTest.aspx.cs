using QiHe.CodeLib;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class frmTest : BasePage
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["your_connection_string"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            Session["LoginName"] = "15602";
            CheckAccess obj = new CheckAccess();
            bool isaccess = false;
            isaccess = true; 
            if (!isaccess)
            {
                this.Form.Visible = false;
                Response.Write(UnAuthorisedAccess.Message(""));
            }

            try
            {
                BindGrid();
            }
            catch (Exception ex)
            {
                DisplayAJAXMessage(this, ex.ToString());
            }

        }

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try 
        {

            string name = txtName.Text;
            int age = int.Parse(txtAge.Text);
            string rollNumber = txtRollNumber.Text;
            string studentClass = txtClass.Text;
            string imagePath = "";

            if (fuImage.HasFile)
            {
                string fileExtension = System.IO.Path.GetExtension(fuImage.FileName).ToLower();
                string[] allowedExtensions = { ".jpg", ".jpeg", ".png", ".gif" };
                int maxFileSize = 2 * 1024 * 1024;

                if (!allowedExtensions.Contains(fileExtension))
                {
                    lblImgError.Text = "Only image files (JPG, PNG, GIF) are allowed.";
                }
                else if (fuImage.PostedFile.ContentLength > maxFileSize)
                {
                    lblImgError.Text = "File size must be less than 2 MB.";
                }
                else
                {
                    imagePath = "~/Images/" + fuImage.FileName;
                    fuImage.SaveAs(Server.MapPath(imagePath));
                }
            }
            else
            {
                lblImgError.Text = "Please select an image to upload.";
            }


            string query = "pInsertStudentInfo";
            string connectionString = ConfigurationManager.ConnectionStrings["your_connection_string"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Name", name);
                cmd.Parameters.AddWithValue("@Age", age);
                cmd.Parameters.AddWithValue("@Image", imagePath);
                cmd.Parameters.AddWithValue("@Class", studentClass);
                cmd.Parameters.AddWithValue("@RollNumber", rollNumber);

                con.Open();
                cmd.ExecuteNonQuery();
                DisplayAJAXMessage(this, "Saved Successfully");
            }
            txtName.Text = "";
            txtAge.Text = "";
            txtRollNumber.Text = "";
            txtClass.Text = "";
            lblImgError.Text = "";

        }
        catch (Exception ex)
        {
            DisplayAJAXMessage(this, ex.ToString());

        }

    }


    protected void btnSubmitTech_Click(object sender, EventArgs e)
    {
        try
        {
            string techname = txtTeachName.Text;
            int age = int.Parse(txtTechAge.Text);
            string sex = ddlSex.SelectedValue;
            string imagePath = "";

            if (fuTeachImg.HasFile)
            {
                string fileExtension = System.IO.Path.GetExtension(fuTeachImg.FileName).ToLower();
                string[] allowedExtensions = { ".jpg", ".jpeg", ".png", ".gif" };
                int maxFileSize = 2 * 1024 * 1024;

                if (!allowedExtensions.Contains(fileExtension))
                {
                    lblTechUpload.Text = "Only image files (JPG, PNG, GIF) are allowed.";
                }
                else if (fuTeachImg.PostedFile.ContentLength > maxFileSize)
                {
                    lblTechUpload.Text = "File size must be less than 2 MB.";
                }
                else
                {
                    imagePath = "~/Images/" + fuTeachImg.FileName;
                    fuTeachImg.SaveAs(Server.MapPath(imagePath));
                }
            }
            else
            {
                lblTechUpload.Text = "Please select an image to upload.";
            }

            string query = "pInsertTacherInfo";
            string connectionString = ConfigurationManager.ConnectionStrings["your_connection_string"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@TechName", techname);
                cmd.Parameters.AddWithValue("@Age", age);
                cmd.Parameters.AddWithValue("@Image", imagePath);
                cmd.Parameters.AddWithValue("@sex", sex);

                con.Open();
                cmd.ExecuteNonQuery();
                DisplayAJAXMessage(this, "Saved Successfully");
            }
            txtTeachName.Text = "";
            txtTechAge.Text = "";
            ddlSex.SelectedIndex = 0;
        }

        catch (Exception ex)
        {
            DisplayAJAXMessage(this, ex.ToString());

        }
    }

    protected void btnSubmitlan_Click(object sender, EventArgs e)
    {
        try
        {
            string subjectname = txtSubName.Text;
            string language = txtlanguage.Text;
            string subjectClass = txSubClass.Text;

            string query = "pInsertSubjectInfo";
            string connectionString = ConfigurationManager.ConnectionStrings["your_connection_string"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Name", subjectname);
                cmd.Parameters.AddWithValue("@Language", language);
                cmd.Parameters.AddWithValue("@Class", subjectClass);

                con.Open();
                cmd.ExecuteNonQuery();
                DisplayAJAXMessage(this, "Saved Successfully");
            }
            txtSubName.Text = "";
            txtlanguage.Text = "";
            txSubClass.Text = "";
        }
        catch (Exception ex)
        {
            DisplayAJAXMessage(this, ex.ToString());

        }
        
    }

    public void BindGrid()
    {
        try
        {
            string query = "pSubjectWithTeacher";
            string connectionString = ConfigurationManager.ConnectionStrings["your_connection_string"].ConnectionString;
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.CommandType = CommandType.StoredProcedure;
            DataTable dt = new DataTable();
            SqlDataReader rd = cmd.ExecuteReader();
            gvSubjectsTeachers.DataSource = rd;
            gvSubjectsTeachers.DataBind();


            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
        }
        catch (Exception ex)
        {
            DisplayAJAXMessage(this, ex.ToString());

        }

    }

    static public void DisplayAJAXMessage(Control page, string msg)
    {
        string myScript = String.Format("alert('{0}');", msg);
        ScriptManager.RegisterStartupScript(page, page.GetType(), "MyScript", myScript, true);
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        try
        {
            string nameFilter = txtSearchName.Text;

            string query = "pSearchStudentName";
            string connectionString = ConfigurationManager.ConnectionStrings["your_connection_string"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Name", nameFilter);

                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                gvStudents.DataSource = dt;
                gvStudents.DataBind();
            }
        }
        catch (Exception ex)
        {
            DisplayAJAXMessage(this, ex.ToString());

        }

    }

}