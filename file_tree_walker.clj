(ns file-tree-walker
  (:require [clojure.java.io :as io]))

(defn walk-file-tree [f proc]
  (if (.isDirectory f)
    (doseq [child (.listFiles f)]
      (walk-file-tree child proc))
    (proc f)))

(walk-file-tree (io/file "C:\\")
                #(println (.getAbsolutePath %)))
