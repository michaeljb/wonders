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
    $('tr#leaders_row').show();
  } else {
    $('tr#leaders_row input').val('')
    $('tr#leaders_row').hide();
  }
  calculateTotals();
}

function usingCities() {
  if ($('#using_cities').is(':checked')) {
    $('tr#city_row').show();
  } else {
    $('tr#city_row input').val('')
    $('tr#city_row').hide();
  }
  calculateTotals();
}

function calculateTotals() {
  var count = parseInt($('#player_count').val(), 10);
  var i, j, $scores, scores, total;

  for (i = 1; i <= count; i++) {
    $scores = $('tr.score td.player' + i + ' input')

    scores = $.map($scores, function (element) {
      var $el = $(element);
      var value = 0;
      if ($el.val() !== '') {
        value = parseInt($el.val(), 10);
      }
      return value;
    });

    total = 0;
    for (j = 0; j < scores.length; j++) {
      total += scores[j];
    }

    $('#total_row td.player' + i + ' input').val(total);
  }
}

$(document).ready(function () {
  changeSelect();
  usingLeaders();
  usingCities();

  $('tr.score input').change(function () {
    calculateTotals();
  });

  $('tr#boards_row input.board_side').bootstrapSwitch();

  $('#using_leaders').bootstrapSwitch();
  $('#using_cities').bootstrapSwitch();
});
