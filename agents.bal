import ballerina/http;
import ballerinax/ai;

final ai:OpenAiProvider _MyAgentModel = check new ("", ai:GPT_4O);
final ai:Agent _MyAgentAgent = check new (
    systemPrompt = {role: "", instructions: string ``}, model = _MyAgentModel, tools = [Mysample]
);

# this is a description
# + path - Request path
# + headers - The entity headers
# + return - Type of the variable
@ai:AgentTool
@display {label: "", iconPath: "https://bcentral-packageicons.azureedge.net/images/ballerina_http_2.14.0.png"}
isolated function Mysample(string path, map<string|string[]>|() headers) returns json|error {
    json var1 = check httpClient->get(path, headers);
    return var1;
}
