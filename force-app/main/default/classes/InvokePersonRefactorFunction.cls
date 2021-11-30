public with sharing class InvokePersonRefactorFunction {

    public static void invokePersonRefactor(String firstName, String lastName) {
        String id = getContact(firstName, lastName);
        functions.Function personRefactor = functions.Function.get('functions_recipes.personrefactor');
        functions.FunctionInvocation invoked = personRefactor.invoke('{"accountid" : "' + id + '"}' );
        String response = invoked.getResponse();
        System.debug('Person Refactor Response: ' + response);
    }

    private static String getContact(String firstName, String lastName) {
        return [SELECT Id FROM Contact WHERE FirstName = :firstName and LastName = :lastName][0].Id;
    }

    private static String createContact(String firstName, String lastName) {
        Contact contact = new Contact(FirstName = firstName, LastName = lastName);
        insert contact;

        return contact.Id;
    }
}
