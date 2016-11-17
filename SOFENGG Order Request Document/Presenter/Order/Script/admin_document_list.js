function clear_form_elements(class_name) {
    $("." + class_name).find(':input').each(function () {
        switch (this.type) {
            case 'password':
            case 'text':
            case 'textarea':
            case 'file':
            case 'select-one':
            case 'select-multiple':
            case 'date':
            case 'number':
            case 'tel':
            case 'email':
                jQuery(this).val('');
                break;
            case 'checkbox':
            case 'radio':
                this.checked = false;
                break;
        }
    });
}

$("#add_document_modal").on('click', function () {
    clear_form_elements("col-sm-5");
    clear_form_elements("checkbox");
});
