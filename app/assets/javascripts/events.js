//= require dataTables/datatables.min.js
//= require validate/jquery.validate.min.js
//= require steps/jquery.steps.min.js



var dd,
  file_title,
  mm,
  today,
  yyyy;

today = new Date;

dd = today.getDate();

mm = today.getMonth() + 1;

yyyy = today.getFullYear();

if (dd < 10) {
  dd = '0' + dd;
}

if (mm < 10) {
  mm = '0' + mm;
}

today = mm + '.' + dd + '.' + yyyy;

file_title = 'ListOfEvents_' + today;

$(function() {
  var form,
    table;
  table = $('.eventList').DataTable({
    pageLength: 25,
    responsive: true,
    ordering: true,
    order: [
      1, 'asc'
    ],
    dom: '<"html5buttons"B>lTfgitp',
    buttons: [
      {
        extend: 'csv'
      }, {
        extend: 'excel',
        title: file_title
      }, {
        extend: 'pdf',
        title: file_title
      }, {
        extend: 'print',
        customize: function(win) {
          $(win.document.body).addClass('white-bg');
          $(win.document.body).css('font-size', '10px');
          $(win.document.body).find('table').addClass('compact').css('font-size', 'inherit');
        }
      }
    ]
  });
  form = $('#eventForm');
  form.validate({
    errorPlacement: function(error, element) {
      element.before(error);
    }
  });
  form.children('div').steps({
    headerTag: 'h3',
    bodyTag: 'section',
    transitionEffect: 'slideLeft',
    onStepChanging: function(event, currentIndex, newIndex) {
      form.validate().settings.ignore = ':disabled,:hidden';
      return form.valid();
    },
    onFinishing: function(event, currentIndex) {
      form.validate().settings.ignore = ':disabled';
      return form.valid();
    },
    onFinished: function(event, currentIndex) {
      alert('Submitted!');
    }
  });
});

if ($('#form').length > 0) {
  $(function() {
    $('#form').steps({
      bodyTag: 'fieldset',
      // forceMoveForward: true,
      labels: {
        finish: "Create Contact"
      },
      onStepChanging: function(event, currentIndex, newIndex) {
        var form;
        form = void 0;
        if (currentIndex > newIndex) {
          return true;
        }
        form = $(this);
        if (currentIndex < newIndex) {
          $('.body:eq(' + newIndex + ') label.error', form).remove();
          $('.body:eq(' + newIndex + ') .error', form).removeClass('error');
        }
        form.validate().settings.ignore = ':disabled,:hidden';
        return form.valid();
      },
      onStepChanged: function(event, currentIndex, priorIndex) {
        var agency, agencySelect, agency_id, americorps, division, divisionSelect, endDate, form_data, location, locationSelect, plc, reportingCycle, reportingCycleSelect, startDate, startYear, title;
        if (currentIndex === 1) {
          form_data = $("form").serialize();

        } else if (currentIndex === 3) {
        //This is where we are going to put the confirmation stuff.
        }
      },
      onFinishing: function(event, currentIndex) {
        var form;
        form = void 0;
        form = $(this);
        form.validate().settings.ignore = ':disabled';
        return form.valid();
      },
      onFinished: function(event, currentIndex) {
        var form;
        form = void 0;
        form = $(this);
        form.submit();
      }
    }).validate({
      errorPlacement: function(error, element) {
        element.before(error);
      },
      rules: {
        start_year: 'required',
        division_id: 'required'
      }
    });
  });
}

$(function() {
  return $('.bsdatepicker').datepicker({
    orientation: 'top auto',
    autoclose: true,
    calendarWeeks: false,
    todayHighlight: true,
    todayBtn: true
  });
});
