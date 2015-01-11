(function () {
  "use strict";

  var fs = require("fs");
  var path = require("path");

  var walkFileTree = function walkFileTree (f, proc) {
    if (fs.statSync(f).isDirectory()) {
      fs.readdir(f, function (err, files) {
        if (err) {
          throw err;
        }
        files.map(function (file) {
          walkFileTree(path.join(f, file), proc);
        });
      });
    } else {
      proc(f);
    }
  };

  var FileTreeWalker =  {
    walkFileTree: walkFileTree
  };
  module.exports = FileTreeWalker;

  FileTreeWalker.walkFileTree("C:\\", function (f) {
    console.log(path.resolve(f));
  });
}.call(this));
