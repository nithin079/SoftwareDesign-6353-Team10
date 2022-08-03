using System.Net;

namespace Repository.Model
{
    public class Response
    {
        public int StatusCode { get; set; }
        public string Message { get; set; }
        public dynamic Result { get; set; }

        public Response(HttpStatusCode statusCode, object result = null, string message = null)
        {
            StatusCode = (int)statusCode;
            Message = message;
            Result = result;
        }
    }
}