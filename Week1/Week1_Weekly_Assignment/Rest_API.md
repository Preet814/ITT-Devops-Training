REST API 

A Representational State Transfer (REST) API is a type of technology or architecture that allows different web applications to talk to each other and exchange data in a predictable manner. It is a way to interact with web services using HTTP requests. 

REST API follow these principles: 

Uses stateless communication (no session stored on the server). 

Works with standard HTTP methods:  

GET → Retrieve data 

POST → Send data (create a new resource) 

PUT → Update an existing resource 

DELETE → Remove a resource 

Uses JSON or XML for data exchange. 

Uses URIs (Uniform Resource Identifiers) to access resources. 


Invoke-RestMethod 

The Invoke-RestMethod cmdlet sends HTTP and HTTPS requests to Representational State Transfer (REST) web services that return richly structured data.  

Required and Comman parameters: 

-URI (Required) 

The API endpoint (URL) you want to access. 

-Method (Reuired) 

The HTTP method (GET, POST, PUT, DELETE, etc.). 

-Headers 

Specifies HTTP headers (e.g., authentication tokens). 

-Body  

Data to send with POST, PUT, or PATCH requests (JSON/XML). 

-ContentType 

Specifies the format of the request body (application/json, application/xml). 

-Credential 

Used for Basic Authentication (username/password). 

 

Examples of Invoke-RestMethod : 

Making a GET request 
Making a POST request 
Making  a PUT request 
Making a DELETE request 


Invoke-WebRequest 

The Invoke-WebRequest cmdlet sends HTTP and HTTPS requests to a web page or web service. It parses the response and returns collections of links, images, and other significant HTML elements. 

Note: Required parameters of Invoke-WebRequest is same as Invoke-RestMethod. 


What is the difference between Invoke-WebRequest and Invoke-RestMethod ? 

Invoke-WebRequest and Invoke-RestMethod are both used in PowerShell to interact with web services, but they are designed for different use cases. 

Invoke-WebRequest is a general-purpose HTTP client that allows users to interact with any type of web resource. It is commonly used for retrieving raw HTML from web pages, downloading files, and handling HTTP responses in detail. Since it returns a complete HTTP response object, it includes information such as headers, status codes, cookies, and raw content. However, when working with APIs that return JSON or XML, Invoke-WebRequest does not automatically parse the response, so users must manually convert the data using ConvertFrom-Json or ConvertFrom-Xml. 

On the other hand, Invoke-RestMethod is specifically designed for working with RESTful APIs. Unlike Invoke-WebRequest, it automatically processes JSON and XML responses, converting them into PowerShell objects for easier manipulation. This makes it the preferred choice when working with REST APIs, as users do not have to manually parse the data. However, Invoke-RestMethod does not provide access to raw HTTP response details such as headers or status codes unless explicitly requested. 

In summary, Invoke-WebRequest is best suited for interacting with websites, handling raw HTTP responses, and downloading files, while Invoke-RestMethod is the better choice for calling APIs that return structured data like JSON or XML.  