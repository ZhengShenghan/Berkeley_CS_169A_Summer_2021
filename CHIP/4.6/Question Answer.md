**Q1.1.** What is the goal of running `bundle install`?

When we run `bundle install` in a project , if there is no `Gemfile.lock` exist, Bundler will fetch all remote sources, resolve dependencies and install all needed gems.

The way Bundler resolve the dependencies is, Bundler will check the dependencies of each gem, and find out the suitable version of gem for not creating any conflict.

**Q1.2.** Why is it good practice to specify `--without production` when running it on your development computer?

If you have a group inside your Gemfile like

```rb
group :production do
    gem 'whatever'
end
```

Then when you run your bundle command on your development machine, it won't install the gems intended for use in your production environment. Basically only installing the gems you need in development on your development machine.

**Q2.1.** Where in the Rails app directory structure is the code corresponding to the `WordGuesserGame` model?

In app.models

**Q2.2.** In what file is the code that most closely corresponds to the logic in the Sinatra apps’ `app.rb` file that handles incoming user actions?

controller.game_controller.rb

**Q2.3.** What class contains that code?

GameController

**Q2.4.** From what other class (which is part of the Rails framework) does that class inherit?

ApplicationController

**Q2.5.** In what directory is the code corresponding to the Sinatra app’s views (`new.erb`, `show.erb`, etc.)?

views

**Q2.6.** The filename suffixes for these views are different in Rails than they were in the Sinatra app. What information does the rightmost suffix of the filename (e.g.: in `foobar.abc.xyz`, the suffix `.xyz`) tell you about the file contents?

xyz is **a top-level domain name**.??????????????????????????????

**Q2.7.** What information does the other suffix tell you about what Rails is being asked to do with the file?

**Q2.8.** In what file is the information in the Rails app that maps routes (e.g. `GET /new`) to controller actions?

**Q2.9.** What is the role of the `:as => 'name'` option in the route declarations of `config/routes.rb`? (Hint: look at the views.)

To present specific message

**Q3.1.** In the Sinatra version, `before do...end` and `after do...end`blocks are used for session management. What is the closest equivalent in this Rails app, and in what file do we find the code that does it?

**Q3.2.** A popular serialization format for exchanging data between Web apps is [JSON](https://en.wikipedia.org/wiki/JSON). Why wouldn’t it work to use JSON instead of YAML? (Hint: try replacing `YAML.load()` with `JSON.parse()` and `.to_yaml` with `.to_json` to do this test. You will have to clear out your cookies associated with `localhost:3000`, or restart your browser with a new Incognito/Private Browsing window, in order to clear out the `session[]`. Based on the error messages you get when trying to use JSON serialization, you should be able to explain why YAML serialization works in this case but JSON doesn’t.)