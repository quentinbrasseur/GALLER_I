$(document).ready(function(){

 $('#start_date').datetimepicker({

disabledDates: window.DISABLE_DATES,
  });

        $('#end_date').datetimepicker({
            useCurrent: false, //Important! See issue #1075
            disabledDates: window.DISABLE_DATES,
        });

        $("#start_date").on("dp.change", function (e) {


            $('#end_date').data("DateTimePicker").minDate(e.date);

        });
        $("#end_date").on("dp.change", function (e) {

            $('#start_date').data("DateTimePicker").maxDate(e.date);

        });

// $('#start_date').datetimepicker();





// $('#start_date').datetimepicker({

//                     disabledDates: window.DISABLE_DATES,
//                 //     icons: {
//                 //     time: "fa fa-clock-o",
//                 //     date: "fa fa-calendar",
//                 //     up: "fa fa-arrow-up",
//                 //     down: "fa fa-arrow-down"
//                 // }

//                 });
// $('#end_date').datetimepicker({

//                     disabledDates: window.DISABLE_DATES,

//                 });


});
