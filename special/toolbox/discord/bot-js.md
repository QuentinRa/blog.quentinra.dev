# Discord Bots (JavaScript)

[Go back](..#discord)

To use a discord, you need to [create](https://discord.com/developers/applications/me) a bot and get your bot token. That's something private that should not be put on GitHub.

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

I won't dig more into the details,

* this [guide is quite good](https://discordjs.guide/#before-you-begin)
* this [documentation is good too](https://discord.js.org/#/docs/main/stable/general/welcome)
* if you are planning to [make a pagination](https://github.com/gazmull/discord-paginationembed#readme) (the one with the emotes to move pages)
* if you are planning to [make a webhook](webhook.md) (a bot taking another username/avatar)