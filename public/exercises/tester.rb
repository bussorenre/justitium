#!/usr/local/bin/ruby
require 'optparse'

def cmdline
  argv = ARGV
  args = {:compile => false, :input => false, :test => true}
  OptionParser.new do |parser|
    parser.on('-r', '--reset', '中間ファイルを削除する？') {|v| args[:reset] = v}
    parser.on('-i', '--input', 'input ファイルを生成するのみ') {|v| args[:input] = v}
    parser.on('-c', '--compile', 'tester をコンパイルするのみ') {|v| args[:compile] = v}
    parser.on('-a', '--all', '全部する') {|v| args[:input] = v;args[:compile] = v}
    parser.permute!(argv)
    args[:target] = argv

  end
  return args
end

args = cmdline


# compile 
if args[:compile]
  args[:target].each do |t|
    if File::ftype(t) != "directory"
      next
    end
    puts "Compile : #{t}/#{t}_test.c" 
    if !system("gcc -o #{t}/tester_#{t} #{t}/#{t}_test.c ")
      exit(status=false)
    end
  end
end

# build input data
if args[:input]
  args[:target].each do |t|
    if File::ftype(t) != "directory"
      next
    end
    Dir.chdir(t) do
      if !system("./tester_#{t}")
        exit(status=false)
      end
    end
  end
end

# build output
if args[:test]
  args[:target].each do |t|
    if File::ftype(t) != "directory"
      next
    end
    puts "Test : #{t}/#{t}.c" 
    Dir.chdir(t) do
      if !system("gcc -o exe_#{t} #{t}.c")
        exit(status=false)
      end
      Dir.glob("input/*").each do |i|
        o = i.gsub(/input/, 'output') 
        if !spawn("./exe_#{t}", :in=>i, :out=>[o, "w"])
          exit(status=false)
        end
      end
    end
  end
end
