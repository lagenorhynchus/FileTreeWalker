require "find"

module FileTreeWalker
  def walk_file_tree(f)
    Find.find(f) do |file|
      if FileTest.file?(file)
        yield(file)
      end
    end
  end

  module_function :walk_file_tree
end

if __FILE__ == $0
  FileTreeWalker.walk_file_tree("C:/") { |f| puts File.expand_path(f) }
end
