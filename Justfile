[private]
default: help

[private]
@help:
	echo
	echo Task runner of skeletal rust gem.
	echo ---------------------------------
	echo
	just --list --unsorted --justfile "{{ justfile() }}"
	echo

# Provision the dependencies.
provision:
	bundle install

# Compiles the code.
compile: provision
	bundle exec rake compile

# Launches the console in dev mode.
console-dev:
	DEV_MODE=ON bin/console

# Builds the gem.
build: compile
	bundle exec rake build

# Shows the bug: installation fails.
install-bundle-bug: build
	bundle exec rake install

# Installs the gem with rake install.
install-rake: build
	rake install

# Installs the gem with gem install.
install-gem: build
	cd pkg && gem install *.gem --local --verbose

# Launches the console on the gem.
console-gem:
	bin/console

# Uninstalls the gem.
uninstall:
	gem uninstall skeleton_rust_gem

# Show the gem store.
store:
	tree `gem env gemdir`/gems/skeleton_rust_gem-0.0.1
	tree `gem env gemdir`/extensions/x86_64-linux/3.1.0/skeleton_rust_gem-0.0.1

# Locates the shared libs.
shared:
	fd -IH '.so$'

# Cleans up the repository.
clean:
	-rm -r pkg/
	-rm lib/**/*.so
	-rm -r tmp/
	-rm -r target/
	-rm Cargo.lock
	-rm Gemfile.lock

# Wipes out code and gem.
wipe:
	just uninstall
	just clean
