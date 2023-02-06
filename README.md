# SeiyuuPicsBot
**This project is now archived.**

Seiyuu Pics Bot is an easily configurable ruby utility that lets you Tweet out random images. While they don't actually have to be pictures of your favorite seiyuu, this bot was initially created for seiyuu pics (kind of).

**This utility is no longer under active development.** [Here](https://twitter.com/randy_rose_pics) was a very weird bot that used this utility.

## Creating a new configuration file
The repository comes with a `config.default.json` file that includes the basic layout of a configuration file. Create a copy of this file (preferably outside of the repository if you are doing development in this project!) and begin to edit the various JSON fields:

* `name` is the name of the bot. This field really has no effect on behavior but is useful for identification purposes.
* `consumer_key`, `consumer_secret`, `access_key`, and `access_secret` are all related to the Twitter API. See the section on *Connecting the Twitter API* for specifics on these fields.
* `image_directory` is the location of the directory with all of your images in it, *relative to this configuration file.*
* `statuses` is a dictionary of various statuses tweeted with your images.
  * A special field of this object is `default`, which will be attached to any image that has no specific status definition.
  * For example, if you add a `yukiyo.png` field to this object with the value `ああっゆきよさま`, then whenever yukiyo.png is tweeted out, it will be tweeted with the status supplied.

Then simply create the directory listed in the `image_directory` field and fill it with any media files you want to tweet out!

## Using the utility
Before running this utility, make sure all gems are installed by running `bundle install`. This is mainly for Twitter functionality.

The main executable file is the `seiyuupicsbot.rb` file. It must be run with a command line argument pointing to a JSON configuration file.

Here's a command line example:
```
./seiyuupicsbot.rb ../my_config.json
```

If everything is correctly set up, the bot should tweet a random image.

To see all command line options, run `./seiyuupicsbot.rb --help`.

## Scheduling tweets regularly
This utility does not act as a daemon that tweets out regularly.

As a result, you'll have to use an outside utility to run this utility on a schedule. On Linux and MacOS, `cron` is a very useful utility for scheduling purposes and is reccomended for use with this utility.

## Connecting the Twitter API
To hook this bot up to a Twitter account correctly, you must create a [Twitter App](https://apps.twitter.com/) for your specific Twitter account. **As of the archiving of this repository, Twitter is charging money for API access. So you'll probably have to pay $100 to do this.**

After the app is created, generate access tokens for your account and you should be able to see the consumer key and secret as well as the access token and secret. These keys should be added to the appropriate spot in your bot's configuration file as seen from above.
