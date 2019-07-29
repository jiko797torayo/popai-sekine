$(function() {
  $('#user_icon_image').change(function(){
    read_image(this);
  });
  $('.icon-image').click(function(){
    $('#user_icon_image').click();
  });
});

function read_image(input) {
  if ( input.files && input.files[0] ) {
    var FR = new FileReader();
    FR.onload = function(e) {
      $('.icon-image').attr('src', e.target.result);
    };
    FR.readAsDataURL( input.files[0] );
  } else {
    $('.icon-image').attr('src', "assets/noimage.png");
  }
};
