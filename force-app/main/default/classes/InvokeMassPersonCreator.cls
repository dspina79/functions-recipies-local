public with sharing class InvokeMassPersonCreator {

    public static void invokeFunction() {
        functions.Function personCreateFunc = functions.Function.get('functions_recipes.masspersoncreator');
        functions.FunctionInvocation massInvoke = personCreateFunc.invoke('{}');
        
        String result = massInvoke.getResponse();
        System.debug(result);
    }
}
