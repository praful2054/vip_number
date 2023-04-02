$(document).ready(function(e){
    "use strict";
    $("#searchNumbersSearchId").autocomplete({
    minLength: 2,
    delay: 500,
    source: function (request, response) {
        $('#searchSpinnerImage').css('display', 'block')
        $.ajax({
            url: '/searchFiltrer',
            data: {search: request.term, saerchCriteria: $("#searchNumbersFormId [name='saerchCriteria']").val()},
            dataType: "json",
            success: function (data) {
                $('#searchSpinnerImage').css('display', 'none')
                if (data.length > 0) {
                    response(data)
                } else {
                    //If no records found, set the default "No match found" item with value -1.
                    response([{label: 'No results found.', val: -1}]);
                }

            },
            fail: function () {
                $('#searchSpinnerImage').css('display', 'none')
            },
            error: function (){
                $('#searchSpinnerImage').css('display', 'none')
            }
        });
    },
    select: function (event, ui) {

        event.preventDefault(); //preventing default methods
        if (ui.item.val == -1) {
            //Clear the AutoComplete TextBox.
            $("#searchNumbersSearchId").val("");
            return false;
        } else {
            let label = ui.item.number
            $("#searchNumbersSearchId").val(label);
            $("#searchNumbersFormId").submit();
        }
    },
}).data("ui-autocomplete")._renderItem = function (ul, item) {
    return $("<li></li>")
        .data("item.autocomplete", item)
        .append("<div style='display: flex; justify-content: space-between; border-bottom: 1px solid lightskyblue'><a>" + item.number + "</a>" + "<a>" + "<span>&#x20b9</span>" + item.rateInRupee + "</a></div>")
        .appendTo(ul);
};
})