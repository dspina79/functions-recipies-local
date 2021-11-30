public with sharing class InvokeGreeterFunction {
    
    public static void invokeGreeting(String payload) {
        functions.Function greetFunction = functions.Function.get('functions_recipes.simplegreeter');
        String messagePayload = '{"greeting" : "Bosco"}';
        functions.FunctionInvocation greetingInvoke = greetFunction.invoke(messagePayload);
        String response = greetingInvoke.getResponse();
        System.debug('Response: ' + response);
    }
}
