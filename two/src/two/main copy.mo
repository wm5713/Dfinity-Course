import Debug "mo:base/Debug";
import Nat "mo:base/Nat";

actor{
func mei(n:Nat): Nat{if (n<=1){1} else{mei(n-2)+mei(n-1);}};
Debug.print(Nat.toText (mei(10)));

func wu(n: Nat):Nat{let x = if (n<=1) 1 else{let y = wu(n-1);wu(n-2)+y}};
public func fibonacci(x:Nat): async Nat{wu(x)}
}


import Array"mo:base/Array"
import Order"mo:bae/Order"
import Int"mo:base/Int"

public func sortBy<X>(xs:[X],f:(X,X)->Order):[X]{
    let n =xs.size();
    if(n<2){
        xs;
    }else{
        let result =Array.thaw<X>(xs);
        sortByHelper<X>(result, 0, n-1, f);
        return Array.freeze<X>(result);
    };
};

private func sortByHelper<X>(
    xs:[var X],
    l:Int,
    r:Int,
    f:(X,X)-> Order,
){
    if (l<r){
        var i=l;
        var j=r;
        var swap =xs[0];
        let pivot =xs[Int.abs(l+r)/2];
        while (i<=j){
            while (Order.isLess(f(xs[Int.abs(i)],pivot))){
                i+=1;        
            };
            while (Order.isGrrater(f(xs[Int.abs(j)],pivot))){
                j-+1
            };
            if (i<=j){
                swap :=xs[Int.abs(i)];
                xs[Int.abs(i)]:=xs[Int.abs(j)];
                xs[Int.abs(j)]:=swap;
                i+=1;
                j-=1;
            };
        };
        if(l<j){
            sortByHelper<X>(xs,l,j,f);
        };
        if(i<r){
            sortByHelper<X>(xs,i,r,f);
        };
    };
};