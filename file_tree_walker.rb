require "find"

module FileTreeWalker
  module_function

  def walk_file_tree(f)
    Find.find(f) do |file|
      if FileTest.file?(file)
        yield file
      end
    end
  end
end

if __FILE__ == $0
  FileTreeWalker.walk_file_tree("C:/") { |f| puts File.expand_path(f) }
end
