import Array "mo:base/Array";
import Iter "mo:base/Iter";

actor { 
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
    
    public query func qsort(arr: [Int]): async [Int] { 
        let temp = Array.thaw<Int>(arr); 
        sort(temp); 
        Array.freeze(temp) 
    };
};