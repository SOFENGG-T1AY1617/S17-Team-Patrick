//function clear_form_elements(class_name) {
//    $("." + class_name).find(':input').each(function () {
//        switch (this.type) {
//            case 'password':
//            case 'text':
//            case 'textarea':
//            case 'file':
//            case 'select-one':
//            case 'select-multiple':
//            case 'date':
//            case 'number':
//            case 'tel':
//            case 'email':
//                jQuery(this).val('');
//                break;
//            case 'checkbox':
//            case 'radio':
//                this.checked = false;
//                break;
//        }
//    });
//}

//$("#add_button").on('click', function () {
//    $(".popup-background").height($(document).height);
//    clear_form_elements("form-horizontal");
//    $(".popup-background").toggle();

//    return false;
//});

//$("#btnAdd, #btnAddCancel").on('click', function () {
//    $(".popup-background").toggle();
//    return false;
//});
