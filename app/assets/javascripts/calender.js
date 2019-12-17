$(document).ready(function() {

  today_total = function(win, lose){
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
      url: "/calenders/create",
      dataType: 'json',
      data: {
        data_win: win,
        data_lose: lose
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
    select: function(win, lose) {
      var title = prompt('本日の収支を入力してください');
      var eventData;
      if (title) {
        eventData = {
          title: title,
          start: win,
          end: lose
        };
        console.log(eventData);
        $('#calendar').fullCalendar('renderEvent', eventData, true);
        $('#calendar').fullCalendar('unselect');
        today_total(win, lose);
      }
    },
    timezone: 'UTC',
    events: '/calenders.json',
    editable: true
  });

});
