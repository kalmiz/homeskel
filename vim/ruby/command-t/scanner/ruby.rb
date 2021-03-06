# Copyright 2010 Wincent Colaiuta. All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#
# 1. Redistributions of source code must retain the above copyright notice,
#    this list of conditions and the following disclaimer.
# 2. Redistributions in binary form must reproduce the above copyright notice,
#    this list of conditions and the following disclaimer in the documentation
#    and/or other materials provided with the distribution.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE
# LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
# INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
# CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
# POSSIBILITY OF SUCH DAMAGE.

module CommandT
  module Scanner
    class Ruby < Base
      class DepthLimitExceeded < ::RuntimeError; end
      class FileLimitExceeded < ::RuntimeError; end

      def initialize path = Dir.pwd, options = {}
        @path                 = path
        @max_depth            = options[:max_depth] || 15
        @max_files            = options[:max_files] || 10_000
        @scan_dot_directories = options[:scan_dot_directories] || false
        #@exclude              = options[:excludes] || /\A(\.git)\z/
        @exclude              = options[:excludes] || /\A(vakbarat)\z/
      end

      def paths
        return @paths unless @paths.nil?
        begin
          @paths = []
          @depth = 0
          @files = 0
          @prefix_len = @path.length
          add_paths_for_directory @path, @paths
        rescue FileLimitExceeded, DepthLimitExceeded
        end
        @paths
      end

    private

      def add_paths_for_directory dir, accumulator
        Dir.foreach(dir) do |entry|
          next if ['.', '..'].include?(entry)
          path = File.join(dir, entry)
          unless entry.match(@exclude)
            if File.file?(path)
              @files += 1
              raise FileLimitExceeded if @files > @max_files
              accumulator << path[@prefix_len + 1..-1]
            elsif File.directory?(path)
              next if (entry.match(/\A\./) && !@scan_dot_directories)
              @depth += 1
              raise DepthLimitExceeded if @depth > @max_depth
              add_paths_for_directory path, accumulator
              @depth -= 1
            end
          end
        end
      rescue Errno::EACCES
        # skip over directories for which we don't have access
      end
    end # class Ruby
  end # module Scanner
end # module CommandT
