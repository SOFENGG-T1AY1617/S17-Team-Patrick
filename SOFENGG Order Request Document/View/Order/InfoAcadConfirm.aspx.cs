using System;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using SOFENGG_Order_Request_Document.Model;

namespace SOFENGG_Order_Request_Document.View.Order
{
    public partial class InfoAcadConfirm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            addStudentDegreeTable(null);
        }

        public void addStudentDegreeTable(StudentDegree studentDegree)
        {

            for (int i = 0; i < 5; i++)
            {
                HtmlTable table = new HtmlTable();
                table.Attributes.Add("class", "table table-bordered table-striped");
                for (int j = 0; j < 6; j++)
                {
                    HtmlTableRow row = new HtmlTableRow();
                    for (int h = 0; h < 2; h++)
                    {
                        HtmlTableCell cell = new HtmlTableCell();
                        String data = "";
                        switch (h)
                        {
                            case 0:
                                switch (j)
                                {
                                    case 0:
                                        data = "Level";
                                        break;
                                    case 1:
                                        data = "Degree";
                                        break;
                                    case 2:
                                        data = "Graduate";
                                        break;
                                    case 3:
                                        data = "YearLevel";
                                        break;
                                    case 4:
                                        data = "AdmittedAs";
                                        break;
                                    case 5:
                                        Button btn1 = new Button();
                                        btn1.ID = "btnEdit";
                                        btn1.Text = "Edit";
                                        btn1.Attributes.Add("class", "btn btn-default");
                                        //btn1.Click += new EventHandler(btnEdit_Click);
                                        cell.Controls.Add(btn1);
                                        cell.Controls.Add(new LiteralControl(" "));
                                        Button btn2 = new Button();
                                        btn2.ID = "btnDelete";
                                        btn2.Text = "Delete";
                                        btn2.Attributes.Add("class", "btn btn-default");
                                        //btn2.Click += new EventHandler(btnEdit_Click);
                                        cell.Controls.Add(btn2);
                                        
                                        row.Cells.Add(cell);
                                        break;
                                }
                                break;
                            case 1:
                                data = "Data";
                                break;
                        }
                        if (j != 5)
                        {
                            cell.Controls.Add(new LiteralControl(data));
                            row.Cells.Add(cell);
                        }
                    }
                    table.Rows.Add(row);
                }
                pnlStudentDegree.Controls.Add(table);
            }
           
        }

        public void GoToInfoMailDe(object sender, EventArgs e)
        {
            
        }

        public void deleteStudentDegree()
        {
            
        }

        public void editStudentDegree()
        {
            
        }

    }
}