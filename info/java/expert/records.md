# Records

Records are a way to reduce the code used to
create a class to store data. For instance, let's says
you want to store a JSON into a class. You need 

* a constructor
* getters (and rarely setters)
* maybe a method equals (and hashcode since they are linked)
* a method toString

Well, records are giving you all of this. To create a record,
simply write

```java
public record MyRecord(int playerAchievements, int friendsPlaying, int timePlayed) {}
```

This record is storing 3 attributes, that's the same as

```java
public class MyRecord {

    private final int playerAchievements;
    private final int friendsPlaying;
    private final int timePlayed;

    public MyRecord(int playerAchievements, int friendsPlaying, int timePlayed) {
        this.playerAchievements = playerAchievements;
        this.friendsPlaying = friendsPlaying;
        this.timePlayed = timePlayed;
    }

    public int playerAchievements() { return this.playerAchievements; }
    public int friendsPlaying() { return this.friendsPlaying; }
    public int timePlayed() { return this.timePlayed; }

    // ... equals, toString, ...
}
```

So you can do 

```java
MyRecord r = new MyRecord(1,0, 5000);
System.out.println(r.playerAchievements());
// 1
System.out.println(r.friendsPlaying());
// 0
System.out.println(r.timePlayed());
// 5000
System.out.println(r.toString());
// MyRecord[playerAchievements=1, friendsPlaying=0, timePlayed=5000]
System.out.println(r.equals(new MyRecord(1,0,5000)));
// true
System.out.println(r.hashCode());
// 5961
```