

import * as functions from 'firebase-functions'
import * as admin from 'firebase-admin'
admin.initializeApp()
const fcm = admin.messaging()
const db = admin.firestore()


export const sendToDeviceCreate = functions.firestore
    .document('Orders/{Id}')
    .onCreate(async (snapshot) => {
        const order = snapshot.data()
        const tokens = []
        const token = await db
            .collection('OrdersToken').get();
        for (let i = 0; i < token.docs.length; i++) {
            tokens.push(token.docs[i].data()['token'].toString());
        }
        const payload = {
            notification: {
                title: `Order  Created =:   Order id = ${order.Order_id} `,
                body: `Order name:  ${order.Order_name} Order date=${order.Order_entry_date}`,
               click_action: 'FLUTTER_NOTIFICATION_CLICK'
            }
        }
        return fcm.sendToDevice(tokens, payload)
    })




exports.sendordersToDeviceDelete= functions.firestore
    .document('Orders/{Id}')
    .onDelete(async (snapshot) => {
   const order = snapshot.data()
        const tokens = []
        const token = await db
        .collection('OrdersToken').get();
    for (let i = 0; i < token.docs.length; i++) {
        tokens.push(token.docs[i].data()['token'].toString());
    }
    const payload = {
        notification: {
              title: `Order  Deleted =:   Order id = ${order.Order_id} `,
            body: `Order name:  ${order.Order_name} Order date=${order.Order_entry_date}`,

        click_action: 'FLUTTER_NOTIFICATION_CLICK'
        }
    }
    return fcm.sendToDevice(tokens, payload)
})



exports.sendordersToDeviceUpdate= functions.firestore
    .document('Orders/{Id}')
    .onUpdate(async(change) =>  {
       const order = change.before.data()
        const orderafter = change.after.data()

    //get token yyy
        const tokens = [];
        const token = await db
        .collection('OrdersToken').get()
    for (let i = 0; i < token.docs.length; i++) {
        tokens.push(token.docs[i].data()['token'].toString())
    }
   const payload = {
        notification: {
            title: `Order  Updated =:   Order id = ${order.Order_id} `,
            body: `Order name old :  ${order.Order_name} Order name after=${orderafter.Order_name}`,

 click_action: 'FLUTTER_NOTIFICATION_CLICK'
        }
      }
    return fcm.sendToDevice(tokens, payload)
})


