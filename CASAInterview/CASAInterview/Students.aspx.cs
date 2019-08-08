using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using CASAInterview;

namespace CASAInterview
{
    public partial class Students : System.Web.UI.Page
    {
        private string retriveAllStudentSql = "SELECT * FROM tblStudents";
        
        //dataset declared here for used in both displaying the table and validation
        private DataSet ds = new DataSet();


        protected void Page_Load(object sender, EventArgs e)
        {
            getAllStudent();
        }

        protected void onButtonAddStudentClick(object sender, EventArgs e)
        {
            //page.isvalide is need for custom validation to continue
            if (Page.IsValid)
            {
                string sqlString = getInsertStudentString(textBoxStudentID.Text, textBoxStudentFirstName.Text, textBoxStudentLastName.Text, Int32.Parse(textBoxStudentPSID.Text), (isActive.Text == "True"));
                Utils.runSqlStatement(sqlString);
                Response.Redirect("Students.aspx");
            }
        }

        protected void getAllStudent()
        {
            SqlConnection con = new SqlConnection(Utils.connectionString);
            SqlCommand cmd = new SqlCommand(retriveAllStudentSql, con);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            
            adapter.Fill(ds);
            gridStudents.DataSource = ds;
            gridStudents.DataBind();            
            con.Close();
        }

        protected string getInsertStudentString(string studentID, string FirstName, string LastName, int PDIS, bool active)
        {
            string sqlString = $"INSERT INTO tblStudents(tblStudentID, FirstName, LastName, PSID, Active, Modified, Created) " +
                                                $"VALUES('{studentID}', '{FirstName}', '{LastName}', '{PDIS}', '{active}', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)";

            return sqlString;
        }

        protected void uniqueStudentIDValidation(object sender, ServerValidateEventArgs e)
        {
            int matchingID = ds.Tables[0].Select($"tblStudentID = '{textBoxStudentID.Text}'").Count();
            if(matchingID == 0)
            {
                e.IsValid = true;
            }
            else
            {
                e.IsValid = false;
            }
        }

        protected void onButtonHomePageClick(object sender, EventArgs e)
        {
            Response.Redirect("MainPage.aspx");
        }
    }
}