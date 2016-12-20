---
title: Installing Google App Engine on Linux
---

## Installing Google App Engine

1. Download the correct package from [Google Cloud SDK Documentation site](https://cloud.google.com/sdk/docs/#linux). **Do not follow the rest of the instructions on that page.** Instead, come back here and follow the steps below.
2. From a Terminal, browse to the directory where the package is located and run:
    ```nohighlight
    $ tar xvzf file
    ```
    Move the app files to your home directory, and then change to that directory:
    ```nohighlight
    $ mv google-cloud-sdk ~/
    $ cd
    ```
3. Run the package's install script:
    ```nohighlight
    $ cd google-cloud-sdk
    $ ./install.sh
    ```
    The script will ask you several questions. Answer `n` when asked to report usage to Google. Answer `Y` when asked to set up your `$PATH`, and accept the default bash profile location (unless you know that you have moved it).

## Creating and running a basic application

You will need to follow these steps for each application that you create. This will be done several times throughout the unit, and differs quite a bit from the process for Windows and Mac.

1. **Make a new application folder** - From your development directory (likely `/home/username/code/`):
    ```nohighlight
    $ mkdir my-app
    ```
2. **Create `app.yaml`** - From the same directory, run:
    ```nohighlight
    $ touch my-app/app.yaml
    ```
    Open `app.yaml` in an editor and add the following contents:
    ```yaml
    application: my-app
    version: 1
    runtime: python27
    api_version: 1
    threadsafe: yes

    handlers:
    - url: /favicon\.ico
      static_files: favicon.ico
      upload: favicon\.ico

    - url: .*
      script: main.app

    libraries:
    - name: webapp2
      version: "2.5.2"
    ```
    This file is the configuration file for your application. You should replace the value `my-app` in the first line with the corresponding name for your application.
3. **Create `main.py`** - From the same directory, run:
    ```nohighlight
    $ touch my-app/main.py
    ```
    Open `main.py` in an editor and add the following contents:
    ```python
    import webapp2

    class MainHandler(webapp2.RequestHandler):
        def get(self):
            self.response.write('Hello world!')

    app = webapp2.WSGIApplication([
        ('/', MainHandler)
    ], debug=True)
    ```
    This is the main file that your code will live in. It creates a simple web application that only allows users to to visit the main URL `/` and only responds with a simple messge, `"Hello world!"`. There is no HTML, no other pages, nothing. We'll learn about making the application more complex as we move through the unit.
4. **Start local development server** - Again, from the `code` directory, run:
    ```nohighlight
    $ dev_appserver.py my-app
    ```
    You will see some output ending with:
    ```nohighlight
    INFO     2016-12-20 01:09:51,956 dispatcher.py:199] Starting module "default" running at: http://localhost:8080
    INFO     2016-12-20 01:09:51,958 admin_server.py:116] Starting admin server at: http://localhost:8000
    ```
    This command starts a server that runs on your laptop, and is accessible only for you for testing.
5. **Test in a browser** - In a browser, visit `http://localhost:8080`. You should see the message `Hello world!`
6. **Terminate the application** - To terminate your application, from teh terminal in which is is running, type `CTRL-C`.
