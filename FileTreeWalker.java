import java.io.File;
import java.util.Arrays;
import java.util.function.Consumer;

class FileTreeWalker {
  public static void walkFileTree(File f, Consumer<File> proc) {
    if (f.isDirectory()) {
      Arrays.stream(f.listFiles())
        .forEach(child -> walkFileTree(child, proc));
    } else {
      proc.accept(f);
    }
  }

  public static void main(String[] args) {
    walkFileTree(new File("C:\\"),
      f -> System.out.println(f.getAbsolutePath()));
  }
}
