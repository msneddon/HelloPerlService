/*
A KBase module: HelloPerlService
*/

module HelloPerlService {
    /*
        Insert your typespec information here.
    */

    funcdef hello(string message)
                returns (string response) authentication required;
};
