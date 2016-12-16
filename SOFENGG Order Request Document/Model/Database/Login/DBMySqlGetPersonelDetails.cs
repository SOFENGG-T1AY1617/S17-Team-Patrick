namespace SOFENGG_Order_Request_Document.Model.Database
{
    public class DBMySqlGetPersonelDetails : DBMySqlSelectConnection
    {
        public Personel Personel;

        protected string Email;
        protected string Password;

        public DBMySqlGetPersonelDetails(string email, string password)
        {
            Email = email;
            Password = password;
        }

        protected override void SetQuery()
        {
            Cmd.CommandText = string.Format("SELECT {3}, {4}, {5} FROM {0} WHERE {1} = @{1} AND {2} = @{2}",
                Personel.Table, Personel.ColEmail, Personel.ColPassword,
                Personel.ColId, Personel.ColFirstName, Personel.ColLastName);

            Cmd.Parameters.AddWithValue("@" + Personel.ColEmail, Email);
            Cmd.Parameters.AddWithValue("@" + Personel.ColPassword, Security.GetMd5(Password));
            Cmd.Prepare();
        }

        public override void Parse()
        {
            if (ObjectList.Length <= 0)
                return;

            Personel = new Personel
            {
                Id = int.Parse(ObjectList[0][Personel.ColId].ToString()),
                LastName = ObjectList[0][Personel.ColLastName].ToString(),
                FirstName = ObjectList[0][Personel.ColFirstName].ToString()
            };
        }
    }
}