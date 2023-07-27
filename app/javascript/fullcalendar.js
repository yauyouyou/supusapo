// app/assets/javascripts/fullcalendar.js

document.addEventListener('DOMContentLoaded', function() {
  var calendarEl = document.getElementById('calendar');

  var calendar = new FullCalendar.Calendar(calendarEl, {
    initialView: 'dayGridMonth', // カレンダーの初期表示を月表示に設定
    events: '/schedules.json',   // スケジュールデータを取得するURLを指定
  });

  calendar.render();
});