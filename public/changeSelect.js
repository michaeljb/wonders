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

$(document).ready(function () {
  changeSelect()
});
