$(function(){
  // 種目追加時に種目数を設定する
  $(document).on('click', '.add-exercise', function() {
    var exerciseCount = $(this).closest('#record_exercises').children('.nested-fields').length;
    $(this).closest('#record_exercises').children('.nested-fields').last().children('.form-group').first().children('.exercise-count').val(exerciseCount);
  });

  // 種目削除時に種目数を設定する
  $(document).on('click', '.remove-exercise', function() {
    var removeExerciseCount = $(this).closest('.nested-fields').children('.form-group').first().children('input').val();
    console.log(removeExerciseCount);
    $(this).closest('#record_exercises').children('.nested-fields').each(function(index, element) {
      if (index < removeExerciseCount) {
        $(element).children('.form-group').first().children('input').val(index + 1);
      } else {
        $(element).children('.form-group').first().children('input').val(index);
      }
    });
  });

  // セット追加時にセット数を設定する
  $(document).on('click', '.add-exercise-detail', function() {
    var setCount = $(this).closest('#exercise_details').children('.nested-fields').length;
    $(this).closest('#exercise_details').children('.nested-fields').last().children('.form-group').first().children('input').val(setCount);
    $(this).closest('#exercise_details').children('.nested-fields').last().children('.form-group').first().children('.set-count').text(setCount);
  });

  // セット削除時にセット数を設定する
  $(document).on('click', '.remove-exercise-detail', function() {
    var removeSetCount = $(this).closest('.nested-fields').children('.form-group').first().children('input').val();
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
