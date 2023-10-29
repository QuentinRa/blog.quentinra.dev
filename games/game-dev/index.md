# Game development

I took note of many pieces of advice, and links that may be useful when developing a game. This is my summary.

Game development is structured in 3 phases

* Planning
* Development
* Production/Release

As many projects are **canceled**, it's quite important for neophytes (and others too) to

* **Always have a working version** 🚀, so that you or others can see what you got now, and you can test things anytime
* **Do the minimum for your game to be playable**: No need to make your goal "The Witcher3", and in the end, cancel everything. Start with a map, then add a player, etc. Add things little by little. And keep your big goals under the carpet, while slowly coming near them.
* **Release!**: even if the game has yet to be the game of the year 😂, and you got some minor bugs, users feedback may influence a lot your planning

> **Making a game is a long and harsh road** 😖. Good luck 🚀.

<hr class="sl">

## 1. Planning

If you don't actually know what kind of game you will make, or at least you got some ideas, the planning is supposed to define all that. **Usually**, you may use what we call a **Game design document**, which is a document telling everything about the game. This is a sort of Scrum board, for Agile developers.

> **Tip**: don't put things under the carpet, "that will be easy" or "...", because most, if not all the time, things aren't easy. That's also why you should start with nearly any content, and add things little by little.

<details class="details-e">
<summary>Metadata</summary>

**Metadata - basic**

* **Name**, **Genre** (RPG 🚀, FPS, ...)
* **Short description**
* **End users** (`Audience`): age, country, language, new players/experienced, platforms

**Metadata - advanced**

* What's the goal? What's the **plus-value** of your game?
* Why should we play your game?
  * Is it the Hero? It is the story?
  * What feelings are you expecting the player to feel?
* What's making the game fun to play?

> In one sentence, we could resume that: YOU ARE NOT THE PLAYER. You got your tastes, and others do too. For instance, you may like bashing/farming a lot of mobs, while others may enjoy an easy game while only focusing on the story. **Ask feedback and dig into this a lot before actually making something**.
</details>

<details class="details-e">
<summary>The game overall</summary>

* What's the world of your game? (open-world?)
* What's the story?
* What's the goal of your Hero?
  * Short-term
  * Mid-term
  * Long-term
* What are the obstacles to the goal?
  * Traps
  * Enemies
* Can the player die? How would he get a "Game over"? Is there "save points"?
* What kind of graphics are you planning to use? Something realist, or more something fantasist?

You should try to find what your game got, that other games didn't.
</details>

<details class="details-e">
<summary>Game Mechanics</summary>

These are the rules of your game. Basically, what the player can do, and what the player can't do.

* Can the Hero, Jump? Walk? Run? Open a door/chest/...?
* What are the items? (perks, loot, usage)
* Is there a looting system? How does it work?
* How are money, player life, time, etc. handled?
* Is the user influencing the world? (ex: `The Witcher 3`, ...)
* What are the places of your game? Give pics/a list of places such as
  * Shops
  * Houses
  * Cities
  * ...

You would also have to define the stats of the player

* is there HP, MP, ATK, ...?
* is there stamina?
* is there an inventory? what's its size? etc.

Things about this carefully, for instance, if you are making a zombie game, you may add a stat "infected" turning the player in a zombie if the stat reached 100 (`game over?`).
</details>

<details class="details-e">
<summary>Game design</summary>

* What's shown on the screen?
  * Is there a mini-map?
  * Is there some skills shortcuts?
  * Is there a life/mana/stamina bar?
  * Is there an icon for the settings? the sound?
  * Is there icons for other players?
  * Is there a chat?
* What are the screens of your game? <small>(you may make a mockup of each screen)</small>
  * Inventory?
  * Play/Pause/Game Over/...
* Is there an animation when switching screens? Describe...
</details>

<details class="details-e">
<summary>Technical specifications</summary>

* How is the user interacting with the game
  * F12: Full Screen?
  * Escape: Settings? Pause?
  * Z: forward, ...
  * ...
* Do the user need a keyboard? a mouse?
* Is a joystick supported?
* How can the user become strong? (combos/...)
* What kind of playstyle should be encouraged? discouraged? (ex: bashing/farming?)
  * are the mobs/monsters respawning? (if not, you could prevent the user from farming)
  * you can prevent the user from accessing some quests/areas

In most games, we are not telling every combo at the start, because it would be too much. As the user is progressing, he/she is learning more combos/things.
</details>

> **Pro tip**: check out what others did, what's worked, what did work, what you enjoyed, what you didn't enjoy, etc., when you lack ideas.
> 
> * [1-Page Game Design Document](https://vitalzigns.itch.io/1-page-gdd)
> * [Game Design Document (GDD) Template](https://vitalzigns.itch.io/gdd)
> * [Game Design Document Template](https://retrocademedia.itch.io/gddtemplate)
> * [Game Design Document Template](https://toddmitchell.itch.io/game-design-document)

<hr class="sr">

## 2. Development

### 2.1. Tools for your game

Starting a game from scratch is really fun 😎✨, you will learn a lot of things about what game engines are actually doing for you. But, it's costing a **lot of time**, and aside from learning something, you are simply trying to reinvent the wheel 🎡, which I not a good idea.

* you should pick a **game engine** (ex: `Unity`, `Unreal engine`, etc.)
* or you should pick a **library** (ex: `LibGDX`, etc.)

It may be weird too, but you may also use **templates** in a game engine. Because a lot of developers are working on the same game engine, you could expect that some developers would build a sort of game engine, inside a game engine, but targeting one game, or one kind of game. [You can learn more about this, in this YouTube video](https://www.youtube.com/watch?v=GG0GVLYzkus). My recommendation is [More Mountains assets](https://moremountains.com/unity-assets).

### 2.2. Tools for coding

You could use **VSCode**, or Jetbrains IDEs <small>(**CLion** for C++, **Rider** for C#)</small> if you are a student, or you got some money 🤑.

### 2.3. Other tips

* Always define who should do what (good planning)
* Do not stay too much time on details/not quite relevant things (on small games)

<hr class="sl">

## 3. Production/Release

Make the game ready to be released.

* Steam? ...
* Credits
* Beta/Way of reporting bugs (and patching them?)

You should also test your game, while telling the testers what kind of feedback you are interested in.

<hr class="sr">

## Replay value

The **replay value** or **replayability** is a score of how much more content the user could discover after completing the game once.

* Alternate/different scenario
* New challenges (new places, new classes, open-world, new difficulties, new play styles)
* Completing the game (i.g. without missing one-time events/items, etc.)
* Multiplayer
* Achievements

More [on Wikipedia](https://en.wikipedia.org/wiki/Replay_value#Performance_grading).