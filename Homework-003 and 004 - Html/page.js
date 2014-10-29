$(function() {
    var client = new WindowsAzure.MobileServiceClient('https://hw3and4.azure-mobile.net/', 'SzIuNCuifnWrTMIXeHCiDxieiRxDGv89'),
        studentTable = client.getTable('student');

    // Read current data and rebuild UI.
    // If you plan to generate complex UIs like this, consider using a JavaScript templating library.
    function refreshStudentTable() {
        var query = studentTable.where({});

        query.read().then(function(studentItems) {
            var listItems = $.map(studentItems, function(item) {
                return $('<li>')
                    .attr('data-studentitem-id', item.id)
                    .append($('<button class="item-delete">Delete</button>'))
                    .append($('<div>').append($('<input class="item-text">').val(item.firstname)));
            });

            $('#student-items').empty().append(listItems).toggle(listItems.length > 0);
            $('#summary').html('<strong>' + studentItems.length + '</strong> item(s)');
        }, handleError);
    }

    function handleError(error) {
        var text = error + (error.request ? ' - ' + error.request.status : '');
        $('#errorlog').append($('<li>').text(text));
    }

    function getStudentItemId(formElement) {
        return $(formElement).closest('li').attr('data-studentitem-id');
    }

    // Handle insert
    $('#add-item').submit(function(evt) {
        var textbox = $('#new-item-text'),
            itemText = textbox.val();
        if (itemText !== '') {
            studentTable.insert({ firstName: itemText }).then(refreshStudentTable, handleError);
        }
        textbox.val('').focus();
        evt.preventDefault();
    });

    // Handle update
    $(document.body).on('change', '.item-text', function() {
        var newText = $(this).val();
        studentTable.update({ id: getStudentItemId(this), firstName: newText }).then(null, handleError);
    });

    // Handle delete
    $(document.body).on('click', '.item-delete', function () {
        studentTable.del({ id: getStudentItemId(this) }).then(refreshStudentTable, handleError);
    });

    // On initial load, start by fetching the current data
    refreshStudentTable();
});