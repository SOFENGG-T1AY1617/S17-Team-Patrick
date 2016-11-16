function PopulateDays() {
    var ddlBirthMonth = document.getElementById("<%=ddlBirthMonth.ClientID%>");
    var ddlBirthYear = document.getElementById("<%=ddlBirthYear.ClientID%>");
    var ddlBirthDay = document.getElementById("<%=ddlBirthDay.ClientID%>");
    var y = ddlBirthYear.options[ddlBirthYear.selectedIndex].value;
    var m = ddlBirthMonth.options[ddlBirthMonth.selectedIndex].value != 0;
    if (ddlBirthMonth.options[ddlBirthMonth.selectedIndex].value != 0 && ddlBirthYear.options[ddlBirthYear.selectedIndex].value != 0) {
        var dayCount = 32 - new Date(ddlBirthYear.options[ddlBirthYear.selectedIndex].value, ddlBirthMonth.options[ddlBirthMonth.selectedIndex].value - 1, 32).getDate();
        ddlBirthDay.options.length = 0;
        AddOption(ddlBirthDay, "DD", "0");
        for (var i = 1; i <= dayCount; i++) {
            AddOption(ddlBirthDay, i, i);
        }
    }
}

function AddOption(ddl, text, value) {
    var opt = document.createElement("OPTION");
    opt.text = text;
    opt.value = value;
    ddl.options.add(opt);
}

function Validate(sender, args) {
    var ddlBirthMonth = document.getElementById("<%=ddlBirthMonth.ClientID%>");
    var ddlBirthYear = document.getElementById("<%=ddlBirthYear.ClientID%>");
    var ddlBirthDay = document.getElementById("<%=ddlBirthDay.ClientID%>");
    args.IsValid = (ddlBirthDay.selectedIndex != 0 && ddlBirthMonth.selectedIndex != 0 && ddlBirthYear.selectedIndex != 0)
}