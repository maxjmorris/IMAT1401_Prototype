<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Retrieve.aspx.cs" Inherits="Retrieve" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        
        <% 
            //declare variable for the column names
            string bor_id;
            string bor_firstname = Request.Form["txtFirstname"];
            string bor_surname = Request.Form["txtSurname"];
            string bor_address_1;
            string bor_address_2;
            string bor_address_3;
            string bor_tel;
            string bor_email;
            string bor_status;
            Int32 Index = 0;
            //The next set of lines create the database connection and execute SQL query
            clsDataConnection User = new clsDataConnection();
            //send the menu code to the stored procedure
            User.AddParameter("@bor_firstname", bor_firstname);
            //send the price to the stored procedure
            User.AddParameter("@bor_surname", bor_surname);
            //execute the query
            User.Execute("sproc_tblBorrower_SelectAll_FilterBy_FirstNameAndSurname");
            //start of table in which we display the results
            Response.Write("<table border=1 cellpadding=4><tr>");
            //Fill in the column headers by looping for each field in the table
            //Within each cycle of the loop, write a table cell with the field name in it
            while (Index < User.Count)
            {
                //start the row of output table
                Response.Write("<tr>");
                //get the id
                bor_id = Convert.ToString(User.DataTable.Rows[Index]["bor_id"]);
                //get the first name
                bor_firstname = Convert.ToString(User.DataTable.Rows[Index]["bor_firstname"]);
                //get the surname
                bor_surname = Convert.ToString(User.DataTable.Rows[Index]["bor_surname"]);
                //get the address 1
                bor_address_1 = Convert.ToString(User.DataTable.Rows[Index]["bor_Address_1"]);
                //get the address 2
                bor_address_2 = Convert.ToString(User.DataTable.Rows[Index]["bor_Address_2"]);
                //get the address 3
                bor_address_3 = Convert.ToString(User.DataTable.Rows[Index]["bor_Address_3"]);
                //get the telephone No
                bor_tel = Convert.ToString(User.DataTable.Rows[Index]["bor_tel"]);
                //get the email
                bor_email = Convert.ToString(User.DataTable.Rows[Index]["bor_email"]);
                //get the status
                bor_status = Convert.ToString(User.DataTable.Rows[Index]["bor_status"]);
                //write the id 
                Response.Write("<td><b>" + bor_id + "</b></td>");
                //write the bor type first name
                Response.Write("<td><b>" + bor_firstname + "</b></td>");
                //write the surname
                Response.Write("<td><b>" + bor_surname + "</b></td>");
                //write the address 1
                Response.Write("<td><b>" + bor_address_1 + "</b></td>");
                //write the address 2
                Response.Write("<td><b>" + bor_address_2 + "</b></td>");
                //write the address 3
                Response.Write("<td><b>" + bor_address_3 + "</b></td>");
                //write the telephone number
                Response.Write("<td><b>" + bor_tel + "</b></td>");
                //write the email
                Response.Write("<td><b>" + bor_email + "</b></td>");
                //write the status
                Response.Write("<td><b>" + bor_status + "</b></td>");
                //point at the next record
                Index++;
                //end the row of output table
                Response.Write("</tr>");
            }
            //end the table
            //close the table row
            Response.Write("</tr>");
            //close the table
            Response.Write("</table>");
 

            %>
    </div>
    </form>
</body>
</html>
