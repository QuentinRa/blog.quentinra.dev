# AbstractFactory or Kit

[Go back](..)

This is a factory of factories where we code each method creating a factory (like we were doing in ``Factory``).

* ✅ : good separation, great isolation
* 🚫 : too much code and maybe too complex

<hr class="sl">

## Example

This is the idea

* Create two abstract classes `Monster` and `Human`
* Each one could have subclasses such as `Gobelin`, `Spider` or `Hero`, `NPC`
* then create the abstract `AbstractFactory`
    * method `monster(...) : Monster`
    * method `human(...) : Human`
* then create two factories
    * `MonsterFactory`: we "only" code `monster(...) : Monster` 
    * `HumanFactory`: we "only" code `human(...) : Human`
* then create a concrete class `UnitCreator` 
  * each method should return a `AbstractFactory` 
  * for instance, `getHumanFactory() : AbstractFactory`
  
In our code, we won't know

* the factories (`MonsterFactory` and `HumanFactory` since we are manipulating `AbstractFactory`)
* the concretes units (since we are using factories)