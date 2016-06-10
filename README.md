# lita-away

**lita-way** is a [lita.io](https://www.lita.io/) handler that saves 'away from keyboard' status messages and informs other users via DM if they @mention a user who is currently afk. Currently very beta. Only known to (sort of) work in Slack.

## Installation

Add lita-away to your Lita instance's Gemfile:

``` ruby
gem "lita-away"
```

## Usage

Tell your bot you are going to be afk:
`@mybot afk Going to grab a burrito`

Now when anyone mentions you directly, your bot will send a DM to unobtrusively let them know what you are up to. The mention will have to be preceded by an "@" or it will not register.

When you get back from your errand, delete your status message like this:
`Finley: afk-undo - Deletes your existing afk status message.`