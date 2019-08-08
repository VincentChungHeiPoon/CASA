using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CASAInterview
{
    public partial class MainPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void onButtonViewStudentClick(object sender, EventArgs e)
        {
            Response.Redirect("Students.aspx");
        }

        protected void onButtonViewSectionClick(object sender, EventArgs e)
        {
            Response.Redirect("Sections.aspx");
        }
        protected void onButtonViewRosterClick(object sender, EventArgs e)
        {
            Response.Redirect("Rosters.aspx");
        }
    }
}