# Introduction

This isn't a course promoting discord,
and you should already know that discord
is an application allowing users to create

* guilds (=a server)
* channels (to chat/talk)

This course are a gathering on notes about
discord and discord API.

<hr class="sr">

## About the application

The desktop application was made using electron
which means that discord desktop app is simply
running in a chromium browser.

* you can use ``CTRL-SHIFT-I`` and open the developer tools
* you can use ``CTRL-R`` to refresh discord (no real use for this)
* ...

Pressing shift while overing a message show a small
popup allowing to get the message id/channel id
and the guild id (used in the api). You can also
delete/... a message using this but most people
are using the right click for these.

The messages are allowing a lot of markdown syntax
so you can use

* ``**bold**``, ``*italic*``, ``~~strikethrough~~``
* writing <code>\`\`some inline code\`\`</code> or some code block

<pre class="language-ld">
<code class="language-ld"
>```c
int main(void){

}
```</code>
</pre>

* spoiler: ``||text||``
* quote: ```> quote```

<hr class="sl">

## BetterDiscord

Better discord is a software improving discord by allowing
you to install plugins. You can find
the code source/latest version [here](https://github.com/BetterDiscord/BetterDiscord/releases).

* download the [installer](https://github.com/BetterDiscord/Installer/releases/tag/v1.0.0-hotfix)
* install and restart discord
* in settings, you got new menus including plugins menu

To install new plugins, what I do is

* settings > plugin > open the plugin folder
* copy and paste a plugin inside the folder
* the plugin can be found [here](https://betterdiscord.app/plugins)
* go back to discord and don't forget to enable the plugin
* if you have a problem updating a plugin, backup
  the plugin data file and reinstall it.

As a side note, I'm living this repository here
[nitro code generator](https://github.com/logicguy1/Discord-Nitro-Generator-and-Checker)
but I don't know if this is working.

<hr class="sr">

## Discord Bots (JavaScript)

To use a discord, you need to [create](https://discord.com/developers/applications/me) a
bot and get your bot token. That's something private
that should not put on github.

```js
const Discord = require('discord.js');
const client = new Discord.Client();

client.once('ready', () => { console.debug(`Logged in as ${client.user.tag}!`) });

client.login('your-token');

// when a message is received
client.on('message', async (message) => { // check event message
    // it's a normal message and not from us so we process it
    if (message.type === 'DEFAULT' && message.author.hasOwnProperty("bot")
        && !message.author.bot) {
        console.log("channel:"+message.channel);
        console.log("message:"+message.content.trim());
        // sending a reply
        message.reply("response");
        // sending a simple text message
        // you may change channel by chaning the id
        // message.channel.id
        await message.channel.send("message")
    }
}
```

I won't dig into the details,

* this [guide](https://discordjs.guide/#before-you-begin) is quite good
* this [documentation](https://discord.js.org/#/docs/main/stable/general/welcome) is good too
* you can check examples [here](https://discord.js.org/#/docs/main/stable/examples/ping)
* if you are planning to make a [pagination](https://github.com/gazmull/discord-paginationembed#readme)
  (the one with the emotes to move pages)
* if you are planning to make a [webhook](webhook.md)
  (bot taking another username/avatar)

<hr class="sl">

## Sources

* <https://support.discord.com/hc/en-us/articles/1500000580222-Ephemeral-Messages-FAQ>

Discord API

* <https://birdie0.github.io/discord-webhooks-guide/>