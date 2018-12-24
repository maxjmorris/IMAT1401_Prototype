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
            //get the Book ID of the book from the form
            string query_BookID = Request.Form["txtBookID"];
            //get the author of the book from the form
            string query_Author = Request.Form["txtAuthor"];
            //get title of the book from the form
            string query_Title = Request.Form["txtTitle"];
            //get the publisher of the book from the form
            string query_Publisher = Request.Form["txtPublisher"];
            //get the published year of the book from the form
            string query_PubYr = Request.Form["txtPubYr"];
            //get the shelf no of the book from the form
            string query_ShelfNo = Request.Form["txtShelfNo"];
            //get the Book Edition of the book from the form
            string query_BookEd = Request.Form["txtBookEd"];
            //get the genre of the book from the form
            string query_Genre = Request.Form["cboGenre"];
            //declare the variable to store the isbn
            string isbn = "";
            //declare variable to store the author 
            string bk_author = "";
            //declare variable to store the title 
            string bk_title = "";
            //declare variable to store the publisher
            string bk_publisher = "";
            //declare variable to store the published year
            decimal bk_pub_yr = 0;
            //declare variable to store the book shelf no
            string bk_shelf_no = "";
            //declare variable to store the book edition no
            int bk_edition_no;
            //declare variable for the genre
            string fk1_genre_code = "";
            //write the data from the form to the browser
            Response.Write("The Title of the Book" + " " + query_Title + " " + "By" + " " + query_Author + "<br>");
            //connect to the database
            clsDataConnection Book = new clsDataConnection();
            //send the isbn to the stored procedure
            Book.AddParameter("@isbn", query_BookID);
            //send the author to the stored procedure
            Book.AddParameter("@bk_author", query_Author);
            ////send the title to the stored procedure
            Book.AddParameter("@bk_title", query_Title);
            //send the publisher to the stored procedure
            Book.AddParameter("@bk_publisher", query_Publisher);
            //send the published year to the stored procedure
            Book.AddParameter("@bk_pub_yr", query_PubYr);
            //send the book shelf no to the stored procedure
            Book.AddParameter("@bk_shelf_no", query_ShelfNo);
            //send the book edition no to the stored procedure
            Book.AddParameter("@bk_edition_no", query_BookEd);
            //send the genre to the stored procedure
            Book.AddParameter("@fk1_genre_code", query_Genre);
            //execute the stored procedure to update the record
            Book.Execute("sproc_tblBook_Update_Book");
            //reset the connection
            Book = new clsDataConnection();
            //send the isbn
            Book.AddParameter("@isbn", query_BookID);
            //execute the other stored procedure
            Book.Execute("sproc__tblBook_filterByBookID");
            //start an HTML table
            Response.Write("<table border=1 cellpadding=4><tr>");
            //if one record is found
            if (Book.Count == 1)
            {
                //get the isbn of the book
                isbn = Convert.ToString(Book.DataTable.Rows[0]["isbn"]);
                //get the author of the book
                bk_author = Convert.ToString(Book.DataTable.Rows[0]["bk_author"]);
                //get the title of the book
                bk_title = Convert.ToString(Book.DataTable.Rows[0]["bk_title"]);
                //get the publisher of the book
                bk_publisher = Convert.ToString(Book.DataTable.Rows[0]["bk_publisher"]);
                //get the published year of the book
                bk_pub_yr = Convert.ToDecimal(Book.DataTable.Rows[0]["bk_pub_yr"]);
                //get the book shelf no of the book
                bk_shelf_no = Convert.ToString(Book.DataTable.Rows[0]["bk_shelf_no"]);
                //get the book edition no of the book
                bk_edition_no = Convert.ToInt32(Book.DataTable.Rows[0]["bk_edition_no"]);
                ////get the genre of the book
                fk1_genre_code = Convert.ToString(Book.DataTable.Rows[0]["fk1_genre_code"]);
                //display the isbn as a column in the table
                Response.Write("<td><b>" + isbn + "</b></td>");
                //display the title as a column in the table
                Response.Write("<td><b>" + "" + bk_title + "" + "</b></td>");
                //display the author as a column in the table
                Response.Write("<td><b>" + bk_author + "</b></td>");

                //close the table row
                Response.Write("</tr>");
                //close the table
                Response.Write("</table>");
                 
                
                //Returns error message if the text field for isbn is blank when clicking update book button
            if (query_BookID == "")
            {
                Response.Redirect("Error.html");
            }//Returns error message if the text field for author is blank when clicking update book button
                if (query_Author == "")
                {
                    Response.Redirect("Error.html");
                }//Returns error message if the text field for title is blank when clicking update book button
                if (query_Title == "")
                {
                    Response.Redirect("Error.html");
                }//Returns error message if the text field for publisher is blank when clicking update book button
                if (query_Publisher == "")
                {
                    Response.Redirect("Error.html");
                }//Returns error message if the text field for shelf no is blank when clicking update book button
                if (query_ShelfNo == "")
                {
                    Response.Redirect("Error.html");
                }
               
            }


         %>
    </div>
</body>
</html>
