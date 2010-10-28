USPS App
========

A simple example of how to use the usps gem
-------------------------------------------

by Matt Di Pasquale


Test Out this App
-----------------

    # Download this app and install the bundled gems.
    cd ~/Sources # or whereever you want to store this app
    git clone http://github.com/mattdipasquale/usps_app.git # download
    cd usps_app
    bundle install # install required gems
    rails server

Then, navigate to <http://localhost:3000/>.


Recreate this App from Scratch
------------------------------

### Creation

    # UPDATE: Skip this block. It's now done by bundler in
    # Configuration of step 2 (below).
    # Download, build & install usps gem.
    cd ~/Sources # or whereever you want to store this gem
    git clone http://github.com/mattdipasquale/usps.git # download
    cd usps
    gem build usps.gemspec
    (sudo) gem install usps

    # Create Rails app.
    cd ~/Projects # or whereever you want to create this app
    rails -h # read the help
    rails new usps_app -OTJ
    cd usps_app
    git init
    git add -A
    git commit -m 'Initial commit'

    # Create repository on GitHub. Then, add it as a remote, and push.
    git remote add origin git@github.com:mattdipasquale/usps_app.git
    git push origin master

### Configuration

  1. To include the usps gem, add the following line to this app's `Gemfile`.

          gem 'usps', :git => 'git://github.com/mattdipasquale/usps.git'

  2. To bundle gems used by this app, run the following command from Terminal.

          bundle install

  3. Configure the usps gem by creating `config/initializers/usps.rb`

          USPS.configure do |config|
            config.username = "username" # get from http://www.usps.com/webtools/
            config.testing = true
          end

### Application

    # To generate Address controller with index action, run this command.
    rails g controller Welcome index --helper=false -t=false

    # Add the following line to the index.html.erb file just generated.
    <p>Address: <%= @address.inspect %></p>

    # Add the following code block to the Welcome controller's index action.
    def index
      @address = USPS::Address.new(
        :address2 => '6406 Ivy Lane',
        :city => 'Greenbelt',
        :state => 'MD'
      ).standardize
    end

    # Delete public/index.html & change config/routes.rb accordingly.
    get "welcome/index"          # delete this line
    root :to => "welcome#index"  # uncomment this line

    # Then, test it out by running:
    rails server

<http://localhost:3000/> should now render the standardized address.

*Note*: To see a detailed diff of changes since the "Initial commit", view the
[commit history][] or do `git log -p` from this app's directory in Terminal.


Best,

Matt Di Pasquale


[commit history]: http://github.com/mattdipasquale/usps_app/commits/master
