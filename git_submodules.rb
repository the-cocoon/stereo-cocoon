SUBS = %w[
  stereo_shop_view
  stereo_shop_view
  git@bitbucket.org:hackblog/stereo_shop_view.git
  master

  stereo_shop_search_engine
  stereo_shop_search_engine
  git@bitbucket.org:the_teacher/stereo_shop_search_engine.git
  master
].each_slice(4)

def submodule_add(name, path, repo, branch)
  puts cmd = "git submodule add -b #{branch} #{repo} #{ path }"
  puts `#{ cmd }`
end

def submodule_rm(name, path, repo, branch)
  puts cmd = "git submodule deinit #{ name }"
  puts `#{ cmd }`

  puts cmd = "git rm --cached #{ path }"
  puts `#{ cmd }`

  puts cmd = "rm -rf /modules/#{ path }"
  puts `#{ cmd }`

  puts cmd = "rm -rf #{ path }"
  puts `#{ cmd }`
end

def submodules_init
  puts cmd = "git submodule init"
  puts `#{ cmd }`
end

def submodules_update
  puts cmd = "git submodule update"
  puts `#{ cmd }`
end

def add_submodules
  SUBS.each do |sub|
    name   = sub[0]
    path   = sub[1]
    repo   = sub[2]
    branch = sub[3]

    submodule_add(name, path, repo, branch)
  end
end

def rm_submodules
  SUBS.each do |sub|
    name   = sub[0]
    path   = sub[1]
    repo   = sub[2]
    branch = sub[3]

    submodule_rm(name, path, repo, branch)
  end

  puts cmd = "git reset --hard"
  puts `#{ cmd }`
end

add_submodules
submodules_init
submodules_update
# rm_submodules
