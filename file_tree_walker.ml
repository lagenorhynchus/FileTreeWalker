module FileTreeWalker : sig
  val walk_file_tree : string -> (string -> unit) -> unit
end = struct
  let rec walk_file_tree f proc =
    if Sys.is_directory f
      then Array.iter (fun child -> walk_file_tree (Filename.concat f child) proc) (Sys.readdir f)
      else proc f
end

let () =
  FileTreeWalker.walk_file_tree "C:\\" print_endline
