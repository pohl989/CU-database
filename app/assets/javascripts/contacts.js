//= require dataTables/datatables.min.js
//= require validate/jquery.validate.min.js
//= require steps/jquery.steps.min.js



var dd,file_title, mm, today, yyyy;

today = new Date;
dd = today.getDate()
mm = today.getMonth() + 1;
yyyy = today.getFullYear();

if (dd < 10) {
  dd = '0' + dd;
}

if (mm < 10) {
  mm = '0' + mm;
}

today = mm + '.' + dd + '.' + yyyy;

file_title = 'ListOfContacts_' + today;

$(function() {
  var form,
    table;
  table = $('.contactList').DataTable({
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
  form = $('#clientForm');
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
          agency_id = $("#agreement_agency_id").val();
          console.log(agency_id);
          form_data = $("form").serialize();
          $.ajax({
            type: 'GET',
            url: '/agencies/' + agency_id + '.json?get_locations=true',
            dataType: 'json',
            success: function(jsonData) {
              var dropDown;
              dropDown = $("#agreement_location_id");
              dropDown.empty();
              dropDown.prop("selectedIndex", 0);
              $.each(jsonData, function(key, value) {
                return dropDown.append($('<option></option>').attr('value', value.id).text(value.code + ": " + value.title));
              });
            },
            complete: function() {
              $('#ajax-loading').hide();
            }
          });
        } else if (currentIndex === 3) {
          title = form.querySelector('#agreement_title').value;
          agencySelect = form.querySelector('#agreement_agency_id');
          agency = agencySelect.options[agencySelect.selectedIndex].innerText;
          divisionSelect = form.querySelector('#agreement_division_id');
          division = divisionSelect.options[divisionSelect.selectedIndex].innerText;
          startYear = form.querySelector('#agreement_start_year').value;
          startDate = form.querySelector('#agreement_start_date').value;
          endDate = form.querySelector('#agreement_end_date').value;
          reportingCycleSelect = form.querySelector('#agreement_reporting_cycle');
          reportingCycle = reportingCycleSelect.options[reportingCycleSelect.selectedIndex].innerText;
          locationSelect = form.querySelector('#agreement_location_id');
          americorps = form.querySelector('#agreement_americorps').value;
          plc = form.querySelector('#agreement_plc').value;
          if (locationSelect.length > 0) {
            location = locationSelect.options[locationSelect.selectedIndex].innerText;
            document.querySelector('#verify-location').textContent = location;
          }
          console.log(startDate + " to " + endDate);
          document.querySelector('#verify-title').textContent = title;
          document.querySelector('#verify-agency').textContent = agency;
          document.querySelector('#verify-division').textContent = division;
          document.querySelector('#verify-start-year').textContent = startYear;
          document.querySelector('#verify-start-date').textContent = startDate;
          document.querySelector('#verify-end-date').textContent = endDate;
          document.querySelector('#verify-reporting-cycle').textContent = reportingCycle;
          console.log("Americorps: " + americorps);
          console.log("PLC: " + plc);
          if (plc != null) {
            document.querySelector('#verify-plc-true').classList.remove('hidden');
          } else {
            document.querySelector('#verify-plc-false').classList.remove('hidden');
          }
          if (americorps != null) {
            document.querySelector('#verify-americorps-true').classList.remove('hidden');
          } else {
            document.querySelector('#verify-americorps-false').classList.remove('hidden');
          }
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
