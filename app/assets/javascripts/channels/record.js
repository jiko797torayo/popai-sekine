App.record = App.cable.subscriptions.create('RecordChannel', {
  connected: function() {
  },

  disconnected: function() {
  },

  received: function(data) {
    console.log('#comments');
    $('#comments').append(data['comment']);
  },

  speak: function(comment) {
    alert(comment);
    return this.perform('speak', { comment: comment });
  }
});

$(function(){
  $(document).on('keypress', '[data-behavior~=comment_speaker]', function(e) {
    if (e.keyCode === 13) {
      App.record.speak(e.target.value);
      e.target.value = '';
      return e.preventDefault();
    }
  });
  $(document).on('click', '.fa-paper-plane', function(e) {
    var formText = $('[data-behavior~=comment_speaker]')
    App.record.speak(formText[0].value);
    formText[0].value = '';
    return e.preventDefault();
  });
});
