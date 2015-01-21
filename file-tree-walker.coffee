"use strict"

fs = require("fs")
path = require("path")

walkFileTree = (f, proc) ->
  if fs.statSync(f).isDirectory()
    fs.readdir(f, (err, files) ->
      if err
        throw err

      files.map((file) ->
        walkFileTree(path.join(f, file), proc)
      )
    )
  else
    proc(f)

FileTreeWalker = {walkFileTree: walkFileTree}
module.exports = FileTreeWalker

FileTreeWalker.walkFileTree("C:\\", (f) ->
  console.log path.resolve(f)
)
