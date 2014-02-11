$(document).ready(function() {
    $('.datatable').dataTable({
        "sPaginationType": "bs_normal",
        "oLanguage": {
        "sProcessing":   '{lang line="dataTable_sProcessing"}',
        "sLengthMenu":   "{lang line='dataTable_sLengthMenu'}",
        "sZeroRecords":  "{lang line='dataTable_sZeroRecords'}",
        "sInfo":         "{lang line='dataTable_sInfo'}",
        "sInfoEmpty":    "{lang line='dataTable_sInfoEmpty'}",
        "sInfoFiltered": "{lang line='dataTable_sInfoFiltered'}",
        //"sInfoPostFix":  '{lang line="dataTable_sInfoPostFix"}',
        "sSearch":       "{lang line='dataTable_sSearch'}",
        //"sUrl":          "{lang line='dataTable_sUrl'}",
            "oPaginate": {
                "sFirst":    "{lang line='dataTable_sFirst'}",
                "sPrevious": "{lang line='dataTable_sPrevious'}",
                "sNext":     "{lang line='dataTable_sNext'}",
                "sLast":     "{lang line='dataTable_sLast'}"
            }
        }
    });    
    $('.datatable').each(function(){
        var datatable = $(this);
        // SEARCH - Add the placeholder for Search and Turn this into in-line form control
        var search_input = datatable.closest('.dataTables_wrapper').find('div[id$=_filter] input');
        search_input.attr('placeholder', '{lang line="dataTable_sPlaceholderSearch"}');
        search_input.addClass('form-control input-sm');
        // LENGTH - Inline-Form control
        var length_sel = datatable.closest('.dataTables_wrapper').find('div[id$=_length] select');
        length_sel.addClass('form-control input-sm');
    });
});