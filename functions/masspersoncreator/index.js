/**
 * Describe Masspersoncreator here.
 *
 * The exported method is the enstry point for your code when the function is invoked. 
 *
 * Following parameters are pre-configured and provided to your function on execution: 
 * @param event: represents the data associated with the occurrence of an event, and  
 *                 supporting metadata about the source of that occurrence.
 * @param context: represents the connection to Functions and your Salesforce org.
 * @param logger: logging handler used to capture application logs and trace specifically
 *                 to a given execution of a function.
 */
 
 module.exports = async function (event, context, logger) {
    var responseData = {
        "success" : false,
        "details" : "",
        "errormessage": ""
    };
    var insertCount = 0;
    let firstNames = ["Abel", "Bernard", "Cameron", "Devon", "Edward", "Frances", "Gina", "Heather", "India", "Joanna", "Katherine", "Linda"];
    let lastNames = ["Aaronson", "Benjamin", "Cole", "Davis", "Ettenberger", "Foldgers", "George", "Harrison", "Iverson", "Jones", "Kildare", "Louis"];
    let middleInitials = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L"];
    try {
        for (firstName in firstNames) {
            for (middleInitial in middleInitials) {
                for (lastName in lastNames) {
                    let record = {"type":"Contact","fields":{"firstname": firstName, "middlename": middleInitial, "lastname": lastname}};
                    const results = await context.org.dataApi.create(record);
                    insertCount++;
                    responseData.details = `Inserted ${insertCount} records`;
                }
            }
        }
        responseData.success = true;
    
    } catch(error) {
        responseData.errormessage = JSON.stringify(error);        
    }
    return responseData;
}
