function changeSelect() {
  var count = parseInt($('#player_count').val(), 10);
  var i, j;

  for (i = 1; i <= count; i++) {
    $('.player' + i).show();
  }
  for (j = count + 1; j <= 8; j++) {
    $('.player' + j).hide();
  }
}

function usingLeaders() {
  if ($('#using_leaders').is(':checked')) {
    $('tr.leaders').show();
  } else {
    $('tr.leaders').hide();
  }
}

function usingCities() {
  if ($('#using_cities').is(':checked')) {
    $('tr.cities').show();
  } else {
    $('tr.cities').hide();
  }
}

$(document).ready(function () {
  changeSelect();
  usingLeaders();
  usingCities();
});
