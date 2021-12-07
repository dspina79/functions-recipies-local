public with sharing class InvokePersonRefactorFunction {

    /**
     * @description Creates a new contact using Salesforce functions
     * 
     * @param firstName The first name of the individual to create.
     * @param lastName The last name of the individual to create.
     */
    public static void invokePersonRefactor(String firstName, String lastName) {
        String id = getContact(firstName, lastName);
        functions.Function personRefactor = functions.Function.get('functions_recipes.personrefactor');
        functions.FunctionInvocation invoked = personRefactor.invoke('{"accountid" : "' + id + '"}' );
        String response = invoked.getResponse();
        System.debug('Person Refactor Response: ' + response);
    }

    /**
     * @description Retrieves a contact based on first name and last name.
     */
    private static String getContact(String firstName, String lastName) {
        return [SELECT Id FROM Contact WHERE FirstName = :firstName and LastName = :lastName][0].Id;
    }

    private static String createContact(String firstName, String lastName) {
        Contact contact = new Contact(FirstName = firstName, LastName = lastName);
        insert contact;

        return contact.Id;
    }
}
