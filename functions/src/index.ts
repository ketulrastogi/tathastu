import * as functions from "firebase-functions";
import * as admin from "firebase-admin";

admin.initializeApp();

const db = admin.firestore();
const timeStatmp = admin.firestore.Timestamp;

exports.createProfile = functions.auth
  .user()
  .onCreate((userRecord, context) => {
    // Do something after a new user account is created
    return db
      .collection("users")
      .doc(userRecord.uid)
      .set({
        uid: userRecord.uid,
        phoneNumber: userRecord.phoneNumber,
        disabled: userRecord.disabled,
        createdOn: timeStatmp.now(),
        updatedOn: timeStatmp.now()
      });
  });

exports.updateProfile = functions.firestore.document('/collections/{id}').onUpdate((change, context) => {
  return admin.firestore().collection('user').doc(change.before.id).set({
    'updatedOn': timeStatmp.now(),
  }, { merge: true });
});