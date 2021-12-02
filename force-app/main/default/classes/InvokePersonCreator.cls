public with sharing class InvokePersonCreator {

    public static void createPerson(String firstName, String lastName) {
        String payload = '{"firstname" : "' + firstName + '", "lastname" : "' + lastName + '"}';
        functions.Function creatorFunction = functions.Function.get('functions_recipes.personcreator');
        functions.FunctionInvocation creatorInvoke = creatorFunction.invoke(payload);
        
        String result = creatorInvoke.getResponse();
        System.debug(result);
    }
}
