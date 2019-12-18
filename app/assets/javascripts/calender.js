$(document).ready(function() {

  create_event = function(title, start, end){
    $.ajaxPrefilter(function(options, originalOptions, jqXHR) {
      var token;
      if (!options.crossDomain) {
        token = $('meta[name="csrf-token"]').attr('content');
        if (token) {
          return jqXHR.setRequestHeader('X-CSRF-Token', token);
        }
      }
    });
    $.ajax({
      type: "post",
      url: "/calenders#create",
      data: {
        title: title,
        start: start.toISOString(),
        end: end.toISOString()
      }
    }).done(function(data){
      alert("登録しました!");
    }).fail(function(){
      alert("登録できませんでした。");
    });
  };

  $('#calendar').fullCalendar({
    header: {
      left: 'prev,next today',
      center: 'title',
      right: 'month,agendaWeek,agendaDay'
    },
    navLinks: true,
    selectable: true,
    selectHelper: true,
    select: function(start, end) {
      var title = prompt('本日の収支を報告してください');
      var eventData;
      if (title) {
        eventData = {
          title: title,
          start: start,
          end: end
        };
        $('#calendar').fullCalendar('renderEvent', eventData, true);
        $('#calendar').fullCalendar('unselect');
        create_event(title, start, end);
      }
    },
    eventClick: function(calEvent) {
      let destroyHTML = 
        `<div class = fc-content>`
      $('#modalTitle').html(calEvent.title);
      $('#calendarModal').modal(); // モーダル着火
      $("#calender").fullcalndar("destroy", destroyHTML, true);
    },
    ttitleFormat: 'YYYY年 M月',
    timeFormat: 'HH:mm',
    timezone: 'Asia/Tokyo', 
    eventColor: '#63ceef',
    eventTextColor: '#000000',
    events: '/calenders.json',
    editable: true
  });
});