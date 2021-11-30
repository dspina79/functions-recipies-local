public with sharing class InvokePersonRefactorFunction {

    public static void invokePersonRefactor(String firstName, String lastName) {
        String id = createContact(firstName, lastName);
        functions.Function personRefactor = functions.Function.get('functions_recipes.personrefactor');
        functions.FunctionInvocation invoked = personRefactor.invoke('{"accountId" : "' + id + '"}' );
        String response = invoked.getResponse();
        System.debug('Person Refactor Response: ' + response);
    }

    private static String createContact(String firstName, String lastName) {
        Contact contact = new Contact(FirstName = firstName, LastName = lastName);
        insert contact;

        return contact.Id;
    }
}
