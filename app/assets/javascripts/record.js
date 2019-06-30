$(function(){
  $(document).on('click', '.add_fields', function() {
    var setCount = $(this).closest('#exercise_details').children(".nested-fields").length;
    $(this).closest('#exercise_details').children(".nested-fields").last().children(".form-group").first().children("input").val(setCount);
    $(this).closest('#exercise_details').children(".nested-fields").last().children(".form-group").first().children(".set-count").text(setCount);
  });
});
