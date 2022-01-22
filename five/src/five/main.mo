import List "mo:base/List";
import Iter "mo:base/Iter";
import Principal "mo:base/Principal";
import Time "mo:base/Time";
actor{
    public type Message = {
        art:Text;
        time:Int;
        author:Text;
    };

    public type Microblog = actor {
        follow: shared (Principal) ->async();//添加关注对象
        follows: shared query ()-> async [Principal];//返回关注列表
        post: shared (Text) -> async(); //发布新消息
        posts: shared query()->async [Message];//返回所有发布的消息
        timeline : shared ()->async [Message];//返回所有关注对象发布的消息
        set_name : shared (Text) -> async();
        get_name : shared (Text) -> async();
        test : shared () -> async ();
    };

    var followed:List.List<Principal> = List.nil();

    public shared func follow(id:Principal):async(){
        followed:=List.push(id,followed)

    };
    public shared func follows():async [Principal]{
        List.toArray(followed)
    };

    var messages : List.List<Message> = List.nil();

    public shared func post(text:Text):async(){
        let a = {
            art = text;
            time = Time.now();
            author = name;
        };
        messages := List.push(a,messages)
    };

    public shared func posts():async [Message]{
        List.toArray(messages)
    };
    public shared func timeline():async [Message]{
        var all: List.List<Message> =List.nil();
        for (id in Iter.fromList(followed)){
            let canister : Microblog = actor(Principal.toText(id));
            let msgs = await canister.posts();
            for (msg in Iter.fromArray(msgs)){
                all := List.push(msg,all)
            }
        };
        List.toArray(all)
    };

    var name: Text = "";
    public shared func set_name(name1: Text) {
        name := name1;
    };

    public shared func get_name():async ?Text {
       ?name
    }
}





