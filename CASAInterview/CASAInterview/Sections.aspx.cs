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
    public partial class Sections : System.Web.UI.Page
    {


        private string retriveAllSectionSql = "SELECT * FROM tblSections";
        //dataset is need to validating unique sectionID
        private DataSet ds = new DataSet();

        protected void Page_Load(object sender, EventArgs e)
        {
                getAllSection();
        }

        protected void getAllSection()
        {

            SqlConnection con = new SqlConnection(Utils.connectionString);
            SqlCommand cmd = new SqlCommand(retriveAllSectionSql, con);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);            
            adapter.Fill(ds);
            gridSections.DataSource = ds;
            gridSections.DataBind();
            con.Close();
        }

        protected void onButtonAddSectionClick(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                //Input are validated on client
                string sqlString = getInsertSectionString(textBoxSectionID.Text, Int32.Parse(textBoxSectionNumber.Text), textBoxCourseID.Text, textBoxDepartment.Text, (DropDownListIsSectionActive.Text == "True"));
                Utils.runSqlStatement(sqlString);
                Response.Redirect("Sections.aspx");
            }
        }

        protected string getInsertSectionString(string tbtSectionID, int sectionNumber, string courseID, string department, bool active)
        {
            string sqlString = $"INSERT INTO tblSections(tblSectionID, SectionNumber, CourseID, Department, Active, Modified, Created) " +
                                                $"VALUES({tbtSectionID}, {sectionNumber}, {courseID}, '{department}', '{active}', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)";

            return sqlString;
        }

        protected void uniqueSectionIDValidation(object sender, ServerValidateEventArgs e)
        {
            int matchingID = ds.Tables[0].Select($"tblSectionID = '{textBoxSectionID.Text}'").Count();
            if (matchingID == 0)
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