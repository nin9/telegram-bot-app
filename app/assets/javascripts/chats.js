// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(function() {
  $('#new_message').on('ajax:success', function(a, b,c) {
    $(this).find('input[type="text"]').val('');
  });
});

$(function() {
  $('[data-channel-subscribe="chat"]').each(function(index, element) {
    var $element = $(element),
        chat_id = $element.data('chat-id')
        messageTemplate = $('[data-role="message-template"]');

    $element.animate({ scrollTop: $element.prop("scrollHeight")}, 1000)

    App.cable.subscriptions.create(
      {
        channel: "ChatChannel",
        chat: chat_id
      },
      {
        received: function(data) {
          var content = messageTemplate.children().clone(true, true);
          content.find('[data-role="user-name"]').text(data.sender_first_name);
          content.find('[data-role="message-body"]').text(data.body);
          content.find('[data-role="message-date"]').text(data.formatted_created_at);
          $element.append(content);
          $element.animate({ scrollTop: $element.prop("scrollHeight")}, 1000);
        }
      }
    );
  });
});