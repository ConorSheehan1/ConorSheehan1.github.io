$(document).ready(() => {
  $('.markdown-block .sqs-block-content h2').css('cursor','pointer');
  $(".markdown-block .sqs-block-content h2").nextUntil("h2").slideToggle();
  $(".markdown-block .sqs-block-content h2").click(() => {
    $(this).nextUntil("h2").slideToggle();
  });

  // configure lightbox
  lightbox.option({
    'resizeDuration': 200,
    'wrapAround': true
  });
});




