<%@ Page Language="C#" %>

 



<!DOCTYPE html>

<script runat="server">

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <div>
        <%
            //get the first name of the borrower from the form
            string query_firstname = Request.Form["txtFirstname"];
            //get the last name of the borrower from the form
            string query_surname = Request.Form["txtSurname"];
            //get borrower ID from the form
            string query_BorrowerID = Request.Form["txtBorID"];
            //get the the first address
            string query_Address1 = Request.Form["txtAddress1"];
            //get the the second address
            string query_Address2 = Request.Form["txtAddress2"];
            //get the the third address
            string query_Address3 = Request.Form["txtAddress3"];
            //get the telephone number
            string query_TelNo = Request.Form["txtTelNo"];
            //get the email address
            string query_EmailAddress = Request.Form["txtEmail"];
            //get the borrower status
            string query_Status = Request.Form["cboStatus"];
            //get the borrower type id from the form
            string query_FKBorrowerType = Request.Form["cboBorType"];
            //declare the variable to store the borrower type
            string fk1_bor_type_id = "";
            //declare variable to store the first name 
            string bor_firstname = "";
            //declare variable to store the surname 
            string bor_surname = "";
            //declare variable to store the borrower ID
            string  bor_id = "";
            //declare variable to store the first address
            string bor_address_1 = "";
            //declare variable to store the second address
            string bor_address_2 = "";
            //declare variable to store the third address
            string bor_address_3 = "";
            //declare variable for the telephone no
            string bor_tel = "";
            //declare variable for the email
            string bor_email = "";
            //declare variable for the status
            string bor_status = "";
            //write the data from the form to the browser
            Response.Write ("Their Name is" +query_firstname+""+ query_surname + "<br>");
            //connect to the database
            clsDataConnection Borrower = new clsDataConnection();
            //send the borrower id to the stored procedure
            Borrower.AddParameter("fk1_bor_type_id", query_FKBorrowerType);
            //send the borrower id to the stored procedure
            Borrower.AddParameter("@bor_id", query_BorrowerID);
            //send the first name to the stored procedure
            Borrower.AddParameter("@bor_firstname", query_firstname);
            //send the surname to the stored procedure
            Borrower.AddParameter("@bor_surname", query_surname);
            //send the first address to the stored procedure
            Borrower.AddParameter("@bor_address_1", query_Address1);
            //send the second address to the stored procedure
            Borrower.AddParameter("@bor_address_2", query_Address2);
            //send the third address to the stored procedure
            Borrower.AddParameter("@bor_address_3", query_Address3);
            //send the telephone no to the stored procedure
            Borrower.AddParameter("@bor_tel", query_TelNo);
            //send the email address to the stored procedure
            Borrower.AddParameter("@bor_email", query_EmailAddress);
            //send the first address to the stored procedure
            Borrower.AddParameter("@bor_status", bor_status);
            //execute the stored procedure to update the record
            Borrower.Execute("sproc_tblBorrower_Update_Borrower");
            //reset the connection
            Borrower = new clsDataConnection();
            //send the borrower id
            Borrower.AddParameter("@bor_id", query_BorrowerID);
            //execute the other stored procedure
            Borrower.Execute("sproc_tblBorrower_FilterByBorID");
            //start an HTML table
            Response.Write("<table border=1 cellpadding=4><tr>");
            //if one record is found
            if (Borrower.Count == 1)
            {
                //get the borrower type of the borrower
                fk1_bor_type_id =Convert.ToString( Borrower.DataTable.Rows[0]["fk1_bor_type_id"]);
                //get the first name of the borrower
                bor_firstname =Convert.ToString( Borrower.DataTable.Rows[0]["bor_firstname"]);
                //get the surname of the borrower
                bor_surname = Convert.ToString(Borrower.DataTable.Rows[0]["bor_surname"]);
                //get the first address for the borrower
                bor_address_1 = Convert.ToString(Borrower.DataTable.Rows[0]["bor_address_1"]);
                //get the second address for the borrower
                bor_address_2 = Convert.ToString(Borrower.DataTable.Rows[0]["bor_address_2"]);
                //get the third address for the borrower
                bor_address_3 = Convert.ToString(Borrower.DataTable.Rows[0]["bor_address_3"]);
                //get the telephone no for the borrower
                bor_tel = Convert.ToString(Borrower.DataTable.Rows[0]["bor_tel"]);
                //get the email address for the borrower
                bor_email = Convert.ToString(Borrower.DataTable.Rows[0]["bor_email"]);
                //get the status for the borrower 
                bor_status = Convert.ToString(Borrower.DataTable.Rows[0]["bor_status"]);
                //get the borrower id for the borrower
                bor_id = Convert.ToString(Borrower.DataTable.Rows[0]["bor_id"]);
                //display the borrower id as a column in the table
                Response.Write("<td><b>" + bor_id + "</b></td>");
                //display the firstname as a column in the table
                Response.Write("<td><b>" +""+ bor_firstname +"" + "</b></td>");
                //display the surname as a column in the table
                Response.Write("<td><b>" + bor_surname + "</b></td>");
            }
            //close the table row
            Response.Write("</tr>");
            //close the table
            Response.Write("</table>");
         %>
    </div>
</body>
</html>

