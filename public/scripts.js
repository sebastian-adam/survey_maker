// FRONTEND
$(function() {
  $('#add-question').click(function() {
    if ($("#q2").css('display') == 'none') {
      $('#q2').show();
    } else {
      $('#q3').show();
      $("#add-question").hide();
    }
  });
});
