---
title: Installing Google App Engine on Linux
---

## Installing Google App Engine

1. Download the correct package from [Google Cloud SDK Documentation site](https://cloud.google.com/sdk/docs/#linux). **Do not follow the rest of the instructions on that page.** Instead, come back here and follow the steps below.
2. From a Terminal, browse to the directory where the package is located and run:
    ```
    $ tar xvzf file
    ```
    Move the app files to your home directory, and then change to that directory:
    ```
    $ mv google-cloud-sdk ~/
    $ cd
    ```
3. Run the package's install script:
    ```
    $ cd google-cloud-sdk
    $ ./install.sh
    ```
    The script will ask you several questions. Answer `n` when asked to report usage to Google. Answer `Y` when asked to set up your `$PATH`, and accept the default bash profile location (unless you know that you have moved it).

## Creating and running a basic application

You will need to follow these steps for each application that you create. This will be done several times throughout the unit, and differs quite a bit from the process for Windows and Mac.

1. **Make a new application folder** - From your development directory (likely `/home/username/code/`):
    ```
    $ mkdir my-app
    ```
2. **Create `app.yaml`** - From the same directory, run:
    ```
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
3. **Create `main.py`** - From the same directory, run:
    ```
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
4. **Start local development server** - Again, from the `code` directory, run:
    ```
    $ dev_appserver.py my-app
    ```
5. **Test in a browser** - In a browser, visit `http://localhost:8080`. You should see the message `Hello world!`
6. **Terminate the application** - To terminate your application, from teh terminal in which is is running, type `CTRL-C`.
