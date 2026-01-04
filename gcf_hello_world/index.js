5. /**
6. * Background Cloud Function to be triggered by Pub/Sub.
7. * This function is exported by index.js, and executed when
 * the trigger topic receives a message.
 *
 * @param {object} data The event payload.
 * @param {object} context The event metadata.
 */
  exports.helloWorld = (data, context) => {
 const pubSubMessage = data;
 const name = pubSubMessage.data
  ? Buffer.from(pubSubMessage.data, 'base64').toString() : "Hello
World";
 console.log(`My Cloud Function: ${name}`);
};
