$(function(){
  // レコードアクセス時に最新のコメントを表示させる
  var obj = document.getElementById('comments');
  if (obj) {
    obj.scrollTop = obj.scrollHeight;
  }

  // 種目追加時に種目数を設定する
  $(document).on('click', '.add-exercise', function() {
    var exerciseCount = $(this).closest('#record_exercises').children('.nested-fields').length;
    console.log(exerciseCount);
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
    $(this).closest('#exercise_details').children('.nested-fields').last().children('.row').first().children('.form-exercise-detail').first().children('input').val(setCount);
    $(this).closest('#exercise_details').children('.nested-fields').last().children('.row').first().children('.form-exercise-detail').first().children('.set-count').text(setCount);
  });

  // セット削除時にセット数を設定する
  $(document).on('click', '.remove-exercise-detail', function() {
    var removeSetCount = $(this).closest('.nested-fields').children('.row').first().children('.form-exercise-detail').first().children('input').val();
    $(this).closest('#exercise_details').children('.nested-fields').each(function(index, element) {
      if (index < removeSetCount) {
        $(element).children('.row').first().children('.form-exercise-detail').first().children('input').val(index + 1);
        $(element).children('.row').first().children('.form-exercise-detail').first().children('.set-count').text(index + 1);
      } else {
        $(element).children('.row').first().children('.form-exercise-detail').first().children('input').val(index);
        $(element).children('.row').first().children('.form-exercise-detail').first().children('.set-count').text(index);
      }
    });
  });
});

// プルダウン項目のajax取得
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
          console.log("errorTh.rown: " + errorTh.rown);
        }
      });
    } else {
      replaceSelectOptions($selectChildren, []);
    }
  };
  $(document).on('change', '.select-parent', replaceChildrenOptions);
});

$(function(){
  $('add-exercise').removeAttr('data-disable-with')
});

// コメント欄の開け閉め
$(function(){
  $('#comment-accordion').click(function() {
    if ($(this).hasClass('accordion-down')) {
      $(this).removeClass('accordion-down');
      $(this).addClass('accordion-up');
      $('#record-show-comment').addClass('comment-close');
      $('#record-show-detail').addClass('detail-open');
      $('#comment-accordion-triangle').removeClass('down-triangle');
      $('#comment-accordion-triangle').addClass('up-triangle');
    } else {
      $(this).removeClass('accordion-up');
      $(this).addClass('accordion-down');
      $('#record-show-comment').removeClass('comment-close');
      $('#record-show-detail').removeClass('detail-open');
      $('#comment-accordion-triangle').removeClass('up-triangle');
      $('#comment-accordion-triangle').addClass('down-triangle');
    }
  });
});
