require "bundler/gem_tasks"

# Adds the ability to run 'rake console' in the terminal and have a console
# that already knows about the gem
task :console do
  exec "pry -r corelib_ruby -I ./lib"
  # exec "irb -r corelib_ruby -I ./lib"
end
