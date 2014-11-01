import java.io.File

object FileTreeWalker {
  def walkFileTree(f: File)(proc: File => Unit): Unit = {
    if (f.isDirectory) {
      // FIXME: NullPointerException
      f.listFiles foreach {child =>
        walkFileTree(child)(proc)
      }
    } else {
      proc(f)
    }
  }

  def main(args: Array[String]): Unit = {
    walkFileTree(new File("""C:\""")) {f =>
      println(f.getAbsolutePath)
    }
  }
}
