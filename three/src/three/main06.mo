import Nat "mo:base/Nat";
import Text "mo:base/Text";

actor Counter {
  type HeaderField = (Text, Text);
  type HttpResponse = {
      status_code: Nat16;
      headers: [HeaderField];
      body: Blob;
  };
  stable var counter = 0;

  // Get the value of the counter.
  public query func get() : async Nat {
    return counter;
  };

  // Set the value of the counter.
  public func set(n : Nat) : async () {
    counter := n;
  };

  // Increment the value of the counter.
  public func inc() : async () {
    counter += 1;
  };

    public query func http_request() : async HttpResponse {
      var list = "<html><body><h1>" # Nat.toText(counter) # "</h1></body></html>";

      {
          status_code = 200;
          headers = [];
          body = Text.encodeUtf8(list)
      }
  };
};
