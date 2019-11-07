# MSM GUI

It's time to add a Graphical User Interface (GUI) on top of our APIs. **Here is the target we're trying to build:**

https://msm-gui.matchthetarget.com/

**Keep it open in a tab.** It's easy to get lost without having our goal in sights. Don't get confused between your app and the target, though; the tab title and favicon should help.

First, read through the code that we're starting with. A good sequence to read through is always:

 - `config/routes.rb` — get a sense of the API (the surface) of the application
 - `app/controllers` — see what logic is going on in each action
 - `app/models/` — get a sense of the tables and business logic (the heart) of the application

You'll see that we're starting at the ending point of MSM Queries.

## Tasks

 - `/` and `/movies`: should display a list of all the movies.
   - There should be a form to add a new movie.
 - `/movies/[ID NUMBER OF AN EXISTING MOVIE]`: should display the details of a movie.
   - There should be forms to add characters to the movie, and update the details of the movie.

## Standard Workflow

 1. Add dummy data to your database: `rails dev:prime`
 1. Start the web server by running `bin/server`.
 1. As you work, remember to keep `/git` open in a tab and **commit often as you work.**

## Handy HTML references

 - https://developer.mozilla.org/en-US/docs/Web/HTML/Element/a
 - https://developer.mozilla.org/en-US/docs/Web/HTML/Element/ul
 - https://developer.mozilla.org/en-US/docs/Web/HTML/Element/dl
 - https://developer.mozilla.org/en-US/docs/Web/HTML/Element/hr
 - https://developer.mozilla.org/en-US/docs/Glossary/Entity
    - https://dev.w3.org/html5/html-author/charref
 - https://developer.mozilla.org/en-US/docs/Web/HTML/Element/table
 - https://developer.mozilla.org/en-US/docs/Web/HTML/Element/select

## Deploying to Heroku

### Sign in to your Heroku account (once per workspace)

 - At a terminal prompt:

    ```
    heroku login
    ```
 - You will see something like:

    ```
    heroku: Press any key to open up the browser to login or q to exit: 
    ```

 - Press a key. You will then see:

    ```
    Opening browser to https://cli-auth.heroku.com/auth/cli/browser/48eda9ea-0edd-426a-91eb-3a8486df4a1c
    ›   Warning: Cannot open browser.
    ```

 - Copy-paste that URL into a browser tab (or <kbd>Cmd</kbd>/<kbd>Ctrl</kbd>`+`click on it). Sign in to your Heroku account. Back in the terminal, you should see:

    ```
    Logging in... done
    Logged in as [YOUR HEROKU EMAIL ADDRESS].
    ```

### Create a production server (once per application)

 - At a terminal prompt,

    ```
    heroku create
    ```

    This will assign a random name to your app. If you want to, you can also choose a name for the app when creating it:

    ```
    heroku create my-cool-app
    ```

    Or, at any time, you can rename the app:

    ```
    heroku rename my-awesome-app
    ```

### Deploying code to your production server

 - Make a git commit with your latest work that you wish to deploy. You can use the web interface at `/git`, or you can run the following commands at a terminal prompt:

    ```
    git add -A
    git commit -m "Describe your changes"
    ```
 - At a terminal prompt,

    ```
    git push heroku HEAD:master
    ```
 - That's it! Your app will be available, once deployed, at `https://my-awesome-app.herokuapp.com` (or whatever name you chose or were assigned).
 - Repeat the two steps above as many times as you like to deploy new changes.

### Set a custom domain

 - To put your app behind a custom domain name, you must first verify your identity by adding a credit card to your Heroku account. This will also lift your app limit from 5 to 100.
 - Then, at a terminal prompt:

    ```
    heroku domains:add www.your-domain.com
    ```
   
 - You will see some instructions:

    ```
    heroku domains:add www.your-domain.com
    Adding test.appdevproject.com to ⬢ my-awesome-app... done
    Configure your app's DNS provider to point to the DNS Target young-peony-foamxxrzcu9xzxd286waw6ay.herokudns.com.
    For help, see https://devcenter.heroku.com/articles/custom-domains
    
    The domain www.your-domain.com has been enqueued for addition
    Run heroku domains:wait 'www.your-domain.com' to wait for completion
    ```

 - Back in your domain registrar, find the place to add "CNAME Records". Depending on the registrar, you will usually under "DNS Settings".
 - Create a CNAME record that points `www` to the target that Heroku gave you (in the example above, `young-peony-foamxxrzcu9xzxd286waw6ay.herokudns.com`).
 - That's it! It usually takes a few minutes to take effect.
