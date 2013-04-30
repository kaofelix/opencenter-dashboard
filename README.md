Support
=======

[![Build Status](https://travis-ci.org/kaofelix/opencenter-dashboard.png)](https://travis-ci.org/kaofelix/opencenter-dashboard)

Issues have been disabled for this repository.  
Any issues with this cookbook should be raised here:

[https://github.com/rcbops/opencenter/issues](https://github.com/rcbops/opencenter/issues)

Please title the issue as follows:

[opencenter-dashboard]: \<short description of problem\>

In the issue description, please include a longer description of the issue, along with any relevant log/command/error output.  
If logfiles are extremely long, please place the relevant portion into the issue description, and link to a gist containing the entire logfile

OpenCenter Dashboard
===

The OpenCenter Dashboard is the winniest awesomesauce there ever did was -- now
with more hipsterstack!

Installation
---

First, you'll need to install a relatively recent version of Node.js
and npm. The easiest way to accomplish this is by installing
[nvm](https://github.com/creationix/nvm), a Node version manager
similar to rvm.

    curl https://raw.github.com/creationix/nvm/master/install.sh | sh

If nvm complains about not being able to add itself to your shell's
config/profile file, you'll have to do so manually and then source it/open a
new shell, as appropriate.

Then, we'll instruct nvm to install the latest stable version of node, which at
this writing is 0.10.5. We'll also make sure that it's the default version.

    nvm install 0.10.5
    nvm alias default 0.10.5

Before proceeding, ensure that `which node` and `which npm` both show
`/your/home/.nvm/version/bin/binary` or similar, and not `/usr/bin` or some
other random path in which you may have another node/npm installed.

The project has a `Gruntfile.coffee` and uses
[Grunt](http://gruntjs.com/) to run different tasks. In order to use
it, you need to install it by doing:

    npm install -g grunt grunt-cli

After that, make sure you have all needed dependencies installed
by running

    npm install

at the root of the project directory. 

Configuration
---

Be sure and copy the included `config.json.sample` file to a file named
`config.json`, then tweak as desired. The most important value is currently the
URL of an OpenCenter endpoint.

Using Grunt
---

After completing the installation, you should be able to run grunt
tasks. Running

    grunt

will build the website on the `./public` directory at the root of the
project.

    grunt server

You can watch the server log in parallel for easy debugging.

    tail -f logs/dashboard.log
    
Will build the necessary coffee and jade files and run the development
server while also watching for changes.

    grunt test
    
Will use the [Karma test runner](http://karma-runner.github.io)
to run [Jasmine](http://pivotal.github.io/jasmine/) specs for the
project.

    grunt clean

Will remove the `./public` folder so you can start fresh if you want.

SSL
---

If you have a hankering to get some securities up in your business,
there's an included `make-cert.sh` script, which will automate the
process of creating a self-signed cert to your liking, which the
server will automatically make use of if present.

Deployment
---

The Gruntfile also includes a `publish` task which will do the needful in a way
that's fakeroot and package friendly, with all the appropriate resources in
`./public`, ready for injection into your favorite neanderthal server of yore,
such as the Apaches or the (e)Ngin(e)-of-X.

Use caution with rapid deployments, as exposed body parts may experience sudden
bursts of awesomeness.
