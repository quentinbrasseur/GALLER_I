$(document).ready(function(){



// $('#start_date').datetimepicker();



// $('#start_date').datetimepicker();
//         $('#end_date').datetimepicker({
//             useCurrent: false //Important! See issue #1075
//         });
//         $("#start_date").on("dp.change", function (e) {
//             $('#end_date').data("DateTimePicker").minDate(e.date);
//         });
//         $("#end_date").on("dp.change", function (e) {
//             $('#start_date').data("DateTimePicker").maxDate(e.date);
//         });

$('#start_date').datetimepicker({

                    disabledDates: window.DISABLE_DATES

                });
$('#end_date').datetimepicker({

                    disabledDates: window.DISABLE_DATES

                });

// $("#end_date").datepicker();
// $("#start_request").datepicker();
// $("#end_request").datepicker();
//$(".datepicker").datepicker()
});
