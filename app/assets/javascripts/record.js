$(function(){
  $(document).on('click', '.add-exercise-detail', function() {
    var setCount = $(this).closest('#exercise_details').children('.nested-fields').length;
    $(this).closest('#exercise_details').children('.nested-fields').last().children('.form-group').first().children('input').val(setCount);
    $(this).closest('#exercise_details').children('.nested-fields').last().children('.form-group').first().children('.set-count').text(setCount);
  });

  $(document).on('click', '.remove-exercise-detail', function() {
    var removeSetCount = $(this).closest('.nested-fields').children('.form-group').first().children('.set-count').text();
    console.log(removeSetCount);
    $(this).closest('#exercise_details').children('.nested-fields').each(function(index, element) {
      if (index < removeSetCount) {
        $(element).children('.form-group').first().children('input').val(index + 1);
        $(element).children('.form-group').first().children('.set-count').text(index + 1);
      } else {
        $(element).children('.form-group').first().children('input').val(index);
        $(element).children('.form-group').first().children('.set-count').text(index);
      }
    });
  });
});
