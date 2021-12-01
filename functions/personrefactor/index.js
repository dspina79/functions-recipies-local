/**
 * Describe Personrefactor here.
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
    logger.info(`Invoking Personrefactor with payload ${JSON.stringify(event.data || {})}`);
    if (event.data.accountid) {
        let query = `SELECT Id, FirstName, LastName FROM Contact WHERE Id = '${event.data.accountid}'`;
        const results = await context.org.dataApi.query(query);
        if (results.length > 0) {
            var result = results[0];
            result.FirstName = result.FirstName + 'y';
            result.LastName = result.LastName + '-ish';
            return result;
        } else {
            return {"response": "record not found for: " + event.data.accountid};
        }
    }    
    return {"response" : "event.data.accountid was null"};
}
