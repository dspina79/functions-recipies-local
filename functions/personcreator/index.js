/**
 * Describe Personcreator here.
 *
 * The exported method is the entry point for your code when the function is invoked. 
 *
 * Following parameters are pre-configured and provided to your function on execution: 
 * @param event: represents the data associated with the occurrence of an event, and  
 *                 supporting metadata about the source of that occurrence.
 * @param context: represents the connection to Functions and your Salesforce org.
 * @param logger: logging handler used to capture application logs and trace specifically
 *                 to a given execution of a function.
 */
 
 module.exports = async function (event, context, logger) {
    if (event.data.firstname && event.data.lastname) {
        let record = {"type":"Contact","fields":{"firstname": event.data.firstname,"lastname": event.data.lastname}};
        const results = await context.org.dataApi.create(record);

        return JSON.stringify(results);
    }
    return "event data not provided";
}
