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
