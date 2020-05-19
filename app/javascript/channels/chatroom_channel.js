import consumer from "./consumer";

const messagesContainer = document.getElementById('messages');
if (messagesContainer) {
  const id = 1;
 
  consumer.subscriptions.create({ channel: "ChatroomChannel", id: id }, {
    received(data) {
      console.log(data);
      messagesContainer.insertAdjacentHTML('beforeend', data);
    }
  });

}

