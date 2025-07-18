//using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Web;
//using System.Web.UI;
//using System.Web.UI.WebControls;


//namespace NewCISProject
//{
//    public partial class _new : System.Web.UI.Page
//    {
//        protected void Page_Load(object sender, EventArgs e)
//        {
//        }

//        protected void btnSubmit_Click(object sender, EventArgs e)
//        {
//            string selectedLocation = txtLocation.Text;

//            if (!string.IsNullOrEmpty(selectedLocation))
//            {
//                lblSelectedLocation.Text = "You confirmed location: " + selectedLocation;
//                lblSelectedLocation.CssClass = "info";
//            }
//            else
//            {
//                lblSelectedLocation.Text = "Please select a location by clicking the 'Select Location' button and choosing on the map.";
//                lblSelectedLocation.CssClass = "warning";
//            }
//        }
//    }
//}


using System;
using System.Web.UI;

namespace NewCISProject
{
    public partial class _new : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            // Get selected location text
            string selectedLocation = txtLocation.Text;

            if (!string.IsNullOrEmpty(selectedLocation))
            {
                Label1.Text = "You confirmed location: " + selectedLocation;
                Label1.CssClass = "info";
            }
            else
            {
                Label1.Text = "Please select a location by clicking the 'Select Location' button and choosing on the map.";
                Label1.CssClass = "warning";
            }
        }
    }
}

