$(document).ready(function(){
  $('.markdown-block .sqs-block-content h2').css('cursor','pointer');
  $(".markdown-block .sqs-block-content h2").nextUntil("h2").slideToggle();
  $(".markdown-block .sqs-block-content h2").click(function() {$(this).nextUntil("h2").slideToggle();});

  // configure lightbox
  lightbox.option({
    'resizeDuration': 200,
    'wrapAround': true
  });
});




