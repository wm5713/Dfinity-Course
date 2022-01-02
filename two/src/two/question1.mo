import Array "mo:base/Array";
import Iter "mo:base/Iter";
import Debug "mo:base/Debug";
import Int "mo:base/Int";

func sort(arr: [var Int]) { 
    for (i in Iter.range(0, arr.size()-1)) { 
        for (j in Iter.range(i, arr.size()-1)) { 
            if (arr[j] < arr[i]) { 
                let temp = arr[i]; 
                arr[i] := arr[j]; 
                arr[j] := temp; 
            }; 
        };
    };
}; 

let a : [var Int]= [var 9,8,7,6,4,3];
sort(a);
var b = "";
for (i in a.vals()) {
    b := b # Int.toText(i) # ", ";
};
Debug.print(b);

