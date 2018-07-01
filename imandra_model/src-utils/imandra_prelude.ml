module List = struct
    type 'a t = 'a list
    let empty = [] 
    let is_empty l = (l = []) 
    let cons hd tl = hd::tl
    let return x = [x] 
    let hd = List.hd
    let tl = List.tl
    let append  = ( @ )
    let rev     = List.rev
    let length  = List.length
    let split   = List.split 
    let map     = List.map 
    let for_all = List.for_all
    let exists  = List.exists
    let fold_left = List.fold_left
    let nth i lst = try Some ( List.nth lst i ) with _ -> None
end
