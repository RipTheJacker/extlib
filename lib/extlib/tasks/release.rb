desc "Publish the release files to RubyForge."
task :release => [ :package ] do

  packages = %w( gem tgz zip ).collect{ |ext| "pkg/#{GEM_NAME}-#{GEM_VERSION}.#{ext}" }

  sh %{rubyforge login}
  sh %{rubyforge add_release #{RUBY_FORGE_PROJECT} #{GEM_NAME} #{GEM_VERSION} #{packages.join(' ')}}
  sh %{rubyforge add_file #{RUBY_FORGE_PROJECT} #{GEM_NAME} #{GEM_VERSION} #{packages.join(' ')}} 
end
