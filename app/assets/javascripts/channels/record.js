$(function(){
  App.record = App.cable.subscriptions.create({
    channel: 'RecordChannel',
    record: $('[data-behavior~=comment_speaker]').data('record')
  }, {
    connected: function() {
    },

    disconnected: function() {
    },

    received: function(data) {
      $('#comments').append(data['comment']);
    },

    speak: function(comment, record, user) {
      return this.perform('speak', { comment: comment, record: record, user: user });
    }
  });
});

$(function(){
  $(document).on('keypress', '[data-behavior~=comment_speaker]', function(e) {
    if (e.keyCode === 13) {
      var formText = $('[data-behavior~=comment_speaker]')
      App.record.speak(e.target.value, formText.data('record'), formText.data('user'));
      e.target.value = '';
      return e.preventDefault();
    }
  });
  $(document).on('click', '.fa-paper-plane', function(e) {
    var formText = $('[data-behavior~=comment_speaker]')
    App.record.speak(formText[0].value, formText.data('record'), formText.data('user'));
    formText[0].value = '';
    return e.preventDefault();
  });
});
