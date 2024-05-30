# SkeletonRustGem

This has been scaffolded by the `bundle gem --ext=rust skeleton_rust_gem` command, following the [official bundler guidelines][buggy-guidelines].

[buggy-guidelines]: https://bundler.io/blog/2023/01/31/rust-gem-skeleton.html

These guidelines are buggy: The `Cargo.toml` line below should be replaced with the `extconf.rb` line further below.

Buggy:

```ruby
spec.extensions = ["ext/skeleton_rust_gem/Cargo.toml"]
```

Correct:

```ruby
spec.extensions = ["ext/skeleton_rust_gem/Cargo.toml"]
```

This issue has been raised of the [rubygems issue tracker][rubygems-7693] and should be fixed [this pull request][rubygems-pr].

[rubygems-7693]: https://github.com/rubygems/rubygems/issues/7693#issuecomment-2137107643
[rubygems-pr]: https://github.com/rubygems/rubygems/pull/7695

You should be able to run `just wipe compile console-dev` (assuming you have the just tool installed), and typing `SkeletonRustGem::hello("Thanos")` in the console should work.

As of now, the scaffolded code does not seem to support installation in some way or another. Run the `just bug-*` recipes for evidence. This is the purpose of the issue report and the pull request above.

As witnessed by [the repository of the `steep` typechecker][steep], the `bundle exec rake install` command should be supported. It is not.

[steep]: https://github.com/soutaro/steep

On the `develop` branch, this issue is fixed, and one may run `just wipe install-gem` or `just wipe install-rake` to install the gem with a `gem install` or a `rake install` command, and one may run the console on the code of the installed gem using `just wipe install-gem clean console-gem` or `just wipe install-rake clean console-gem`.

However, for an unknown reason, the `just install-bundle-bug` recipe fails to install the gem with the `bundle exec rake install` command.
