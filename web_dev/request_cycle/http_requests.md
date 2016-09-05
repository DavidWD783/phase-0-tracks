#What are common HTTP status codes?
##101 - Switching Protocols (server understands requests and will comply)
##200 - OK (request has been successful)
##202 - Accepted (Request was accepted for processing)
##401 - Unauthorized (request requires more user authentication than permitted)
##402 - Payment Required
##403 - Forbidden
##404 - Not Found (server has not found anything that matches request)

#What is the difference between a GET request and a POST request?  When might each be used?
##A GET request asks for data from a specified resource whereas a POST request submits the data it wants processed to a specific resource.  GET are used for viewing data without changing it while POST can have side affects on site data because it changes something.
##An example of a GET request is a page with a 'search' feature or function; you ask the specific resource for data without needing to change it.
##An example of a POST request is a page or form that changes a password you may have entered.

#What is a cookie?  How does it relate to HTTP requests?
##Cookies are small files that are stored on a user's computer that hold a small amount of specific data about a client and a website; the data can be accessed by the server OR the client's computer.
##Cookie's are small key/value pairs that contain data; once the pair has been read by the client computer, the data can be retrieved and used to display the page according to the user's settings.
##Cookie's are created when the webpage is loaded and help carry information from one session on a particular webpage to another session on the same page or a different one.