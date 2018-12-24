<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewBooks.aspx.cs" Inherits="ViewUser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>

        <%
            string isbn;
            string bk_author;
            string bk_title;
            string bk_publisher;
            decimal bk_pub_yr;
            string bk_shelf_no;
            int bk_edition_no;
            string fk1_genre_code;
            Int32 Index = 0;
            //The next set of lines create the database connection and execute SQL query
            clsDataConnection Book = new clsDataConnection();
            Book.Execute("sproc_tblBook_SelectAll");
            //start of table in which we display the results
            Response.Write("<table border=1 cellpadding=4><tr>");
            //Fill in the column headers by looping for each field in the table
            //Within each cycle of the loop, write a table cell with the field name in it
            while (Index < Book.Count)
            {
                //start the row of output table
                Response.Write("<tr>");
                //get the bookid
                isbn =Convert.ToString(Book.DataTable.Rows[Index]["isbn"]);
                //get the author
                bk_author = Convert.ToString(Book.DataTable.Rows[Index]["bk_author"]);
                //get the title
                bk_title = Convert.ToString(Book.DataTable.Rows[Index]["bk_title"]);
                //get the publisher
                bk_publisher = Convert.ToString(Book.DataTable.Rows[Index]["bk_publisher"]);
                //get the publishing year
                bk_pub_yr = Convert.ToDecimal(Book.DataTable.Rows[Index]["bk_pub_yr"]);
                //get the shelf number
                bk_shelf_no = Convert.ToString(Book.DataTable.Rows[Index]["bk_shelf_no"]);
                //get the edition no
                bk_edition_no = Convert.ToInt32(Book.DataTable.Rows[Index]["bk_edition_no"]);
                //get the genre code
                fk1_genre_code = Convert.ToString(Book.DataTable.Rows[Index]["fk1_genre_code"]);
                //write the code column
                Response.Write("<td><b>" + isbn + "</b></td>");
                //write the author column
                Response.Write("<td><b>" + bk_author + "</b></td>");
                //write the title column
                Response.Write("<td><b>" + bk_title + "</b></td>");
                //get the publisher column
                Response.Write("<td><b>" + bk_publisher + "</b></td>");
                //get the pub year
                Response.Write("<td><b>" + bk_pub_yr + "</b></td>");
                //get the shelf no
                Response.Write("<td><b>" +  bk_shelf_no + "</b></td>");
                //get the edition no
                Response.Write("<td><b>" + bk_edition_no + "</b></td>");
                //get the genre code
                Response.Write("<td><b>" + fk1_genre_code + "</b></td>");
                //point at the next record
                Index++;
                //end the row of output table
                Response.Write("</tr>");
            }
            //end the table
            Response.Write("</table>");
         %>
    </div>
    </form>
</body>
</html>

    </div>
    </form>
</body>
</html>
