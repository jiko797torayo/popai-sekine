$(function(){
  // 種目追加時に種目数を設定する
  $(document).on('click', '.add-exercise', function() {
    var exerciseCount = $(this).closest('#record_exercises').children('.nested-fields').length;
    $(this).closest('#record_exercises').children('.nested-fields').last().children('.form-group').first().children('.exercise-count').val(exerciseCount);
  });

  // 種目削除時に種目数を設定する
  $(document).on('click', '.remove-exercise', function() {
    var removeExerciseCount = $(this).closest('.nested-fields').children('.form-group').first().children('input').val();
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

$(function(){
  var replaceChildrenOptions, replaceSelectOptions;
  replaceSelectOptions = function($select, results) {
    $select.html($(this).closest('option'));
    $.each(results, function() {
      var option;
      option = $('<option>').val(this.id).text(this.name);
      $select.append(option);
    });
  };
  replaceChildrenOptions = function() {
    var $selectChildren, childrenPath;
    childrenPath = $(this).find('option:selected').data().childrenPath;
    $selectChildren = $(this).closest('.nested-fields').find('.select-children');
    if (childrenPath != null) {
      $.ajax({
        url: childrenPath,
        dataType: "json",
        success: function(results) {
          replaceSelectOptions($selectChildren, results);
        },
        error: function(XMLHttpRequest, textStatus, errorThrown) {
          console.error("Error occurred in replaceChildrenOptions");
          console.log("XMLHttpRequest: " + XMLHttpRequest.status);
          console.log("textStatus: " + textStatus);
          console.log("errorThrown: " + errorThrown);
        }
      });
    } else {
      replaceSelectOptions($selectChildren, []);
    }
  };
  $(document).on('change', '.select-parent', replaceChildrenOptions);
});

