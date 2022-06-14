var show = 3; //最初に表示する件数
var num = 3;  //clickごとに表示したい件数
var contents = '.list li'; // 対象のlist
$(contents + ':nth-child(n + ' + (show + 1) + ')').addClass('is-hidden');
$('.more').on('click', function () {
  $(contents + '.is-hidden').slice(0, num).removeClass('is-hidden');
  if ($(contents + '.is-hidden').length == 0) {
    $('.more').fadeOut();
  }
});