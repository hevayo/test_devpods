import ballerina/http;
import ballerinax/ai;

listener ai:Listener MyAgentListener = new (listenOn = check http:getDefaultListener());

service /MyAgent on MyAgentListener {
    resource function post chat(@http:Payload ai:ChatReqMessage request) returns ai:ChatRespMessage|error {

        string stringResult = check _MyAgentAgent->run(request.message, request.sessionId);
        return {message: stringResult};
    }
}
