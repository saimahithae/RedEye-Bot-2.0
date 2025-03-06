const functions = require("firebase-functions");

exports.runBot = functions.https.onRequest((req, res) => {
  res.send("🚀 RedEye Bot is running successfully!");
});
