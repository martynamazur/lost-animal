const {setGlobalOptions} = require("firebase-functions");
const admin = require("firebase-admin");
admin.initializeApp();

setGlobalOptions({ maxInstances: 10 });

const { onDocumentCreated } = require("firebase-functions/v2/firestore");
const logger = require("firebase-functions/logger");

exports.newMessageNotification = onDocumentCreated(
  "chats/{chatId}/messages/{msgId}",
  async (event) => {
    try {
      const messageData = event.data?.data();
      const chatId = event.params.chatId;

      logger.info("New message in chatId:", chatId, {
        senderId: messageData?.senderId,
        text: messageData?.text?.substring(0, 50) + "..."
      });

      const chatDoc = await admin.firestore().collection("chats").doc(chatId).get();
      if (!chatDoc.exists) {
        logger.error("Chat does not exist:", chatId);
        return;
      }

      const chatData = chatDoc.data();
      const senderId = messageData.senderId;
      const receiverId = chatData.participants.find(uid => uid !== senderId);

      if (!receiverId) {
        logger.error("Receiver not found in chat:", chatId);
        return;
      }

      logger.info("Sending notification to:", receiverId);

      const userDoc = await admin.firestore().collection("users").doc(receiverId).get();
      if (!userDoc.exists) {
        logger.error("User does not exist in database:", receiverId);
        return;
      }

      const userData = userDoc.data();
      const receiverFcmToken = userData?.fcmToken;

      if (!receiverFcmToken) {
        logger.error("No FCM token for user:", receiverId);
        return;
      }

      const senderName = messageData.senderName || 
                        chatData.participantDisplayNames?.[senderId] || 
                        "Unknown user";

      const payload = {
        data: {
          chatId: chatId,
          senderId: senderId,
          messageId: event.params.msgId,
          type: "chat_message",
          text: messageData.text || "",
          senderName: senderName,
          notificationTitle: "New message",
          notificationBody: `${senderName}: ${messageData.text}`
        },
      };

      const response = await admin.messaging().send({
        token: receiverFcmToken,
        notification: payload.notification,
        data: payload.data,
      });
      
      logger.info("Notification sent successfully to:", receiverId, "Response:", response);

    } catch (error) {
      logger.error("Error in Cloud Function:", error);
    }
  }
);