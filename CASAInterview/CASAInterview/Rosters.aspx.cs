using System;
using System.Collections.Generic;
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
    //need to varift all validation
    //need to create custom validation for adding student to section
    //need to create datagrid for showing student, section, student in what section
    public partial class Rosters : System.Web.UI.Page
    {

        private string retriveAllRosters = "SELECT * FROM tblRosters";
        private string retriveStudentIDAndName = "SELECT tblStudentID, LastName FROM tblStudents";
        private string retriveSectionID = "SELECT tblSectionID FROM tblSections";

        private DataSet studentInfo = new DataSet();
        private DataSet roster = new DataSet();
        private DataSet sectionID = new DataSet();


        protected void Page_Load(object sender, EventArgs e)
        {
            getStudentSectionAndRostersTable();
        }

        protected void getStudentSectionAndRostersTable()
        {
            using (SqlConnection con = new SqlConnection(Utils.connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(retriveStudentIDAndName, con))
                {
                    using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                    {
                        adapter.Fill(studentInfo);
                        gridStudentInfo.DataSource = studentInfo;
                        gridStudentInfo.DataBind();
                    }
                }

                using (SqlCommand cmd = new SqlCommand(retriveAllRosters, con))
                {
                    using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                    {
                        adapter.Fill(roster);
                        gridRosters.DataSource = roster;
                        gridRosters.DataBind();
                    }
                }

                using (SqlCommand cmd = new SqlCommand(retriveSectionID, con))
                {
                    using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                    {
                        adapter.Fill(sectionID);
                        gridSectionID.DataSource = sectionID;
                        gridSectionID.DataBind();
                    }
                }
            }
        }

        

        protected void onButtonAddStudentToSectionClick(object sender, EventArgs e)
        {
            if(Page.IsValid)
            {
                string sqlString = getInsertRosterString(textBoxRosterID.Text, textBoxStudentID.Text, textBoxSectionID.Text, (DropDownListIsRosterActive.Text == "True"));
                Utils.runSqlStatement(sqlString);
                Response.Redirect("Rosters.aspx");
            }
        }

        protected string getInsertRosterString(string rosterID, string student_ID, string section_ID, bool Active)
        {
            string sqlString = $"INSERT INTO tblRosters (tblRosterID, tblStudent_ID, tblSection_ID, Active, Modified, Created)" +
                $"VALUES ('{rosterID}', '{student_ID}', '{section_ID}', '{Active}', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)";
            return sqlString;
        }


   

        protected void uniqueStudentIDValidation(object sender, ServerValidateEventArgs e)
        {
            int matchingID = studentInfo.Tables[0].Select($"tblStudentID = '{textBoxStudentID.Text}'").Count();
            if (matchingID == 0)
            {
                e.IsValid = false;
            }
            else
            {
                e.IsValid = true;
            }
        }

        protected void uniqueSectionIDValidation(object sender, ServerValidateEventArgs e)
        {
            int matchingID = sectionID.Tables[0].Select($"tblSectionID = '{textBoxSectionID.Text}'").Count();
            if (matchingID == 0)
            {
                e.IsValid = false;
            }
            else
            {
                e.IsValid = true;
            }
        }

        protected void uniqueRosterIDValidation(object sender, ServerValidateEventArgs e)
        {
            int matchingID = roster.Tables[0].Select($"tblRosterID = '{textBoxRosterID.Text}'").Count();
            if (matchingID == 0)
            {
                e.IsValid = true;
            }
            else
            {
                e.IsValid = false;
            }
        }

        protected void uniqueStudentSectioValidation(object sender, ServerValidateEventArgs e)
        {
            int matchingID = roster.Tables[0].Select($"tblStudent_ID = '{textBoxStudentID.Text}' and tblSection_ID ='{textBoxSectionID.Text}'").Count();
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