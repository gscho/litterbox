module Litterbox
  # CLI Command operations
  module Command
    class << self
      def exec(cmd)
        cmd = "sudo #{cmd}" if ENV['USE_SUDO']
        Open3.popen3(cmd) do |_, stdout, stderr, thr|
          while (line = stderr.gets)
            puts(line)
          end
          while (line = stdout.gets)
            puts(line)
          end
          return thr
        end
      end
    end
  end
end
