# Iterator

[Go back](..)

The main idea is to iterate an unknown group of objects, all having the same type.

* ✅ : easy iteration
* 🚫 : usually you can't modify the data of the iterator

<hr class="sl">

## Example in java

```java
public class Sac implements Iterable<Object> {
    private final ArrayList<Object> objects;

    public Sac(Object ... objects){ this.objects = new ArrayList<>(Arrays.asList(objects)); }

    // proxy
    public boolean ajouter(Object o){ return this.objects.add(o); }
    public boolean retirer(Object o){ return this.objects.remove(o); }
    public boolean contient(Object o){ return this.objects.contains(o); }

    @Override
    public Iterator<Object> iterator() {
        return new SacIterator(this);
        // remarque : on aurait pu faire
        // return this.objects.iterator();
    }

    // iterator of my Sac
    private static class SacIterator implements Iterator<Object> {

        private int current;
        private final Sac sac;

        public SacIterator(Sac sac) {
            this.sac = sac;
            this.current = -1; // starts right before 0
        }

        @Override // do we have a next ?
        public boolean hasNext() { return this.current+1 < this.sac.objects.size(); }

        @Override
        public Object next() {
            // the documentation says that we must throw NoSuchElementException
            if(!hasNext()) throw new NoSuchElementException("no such elements");
            this.current++;
            return this.sac.objects.get(this.current);
        }
    }
    
    // ...

    public static void main(String[] args) {
        Sac sac = new Sac(new Hero(), new Hero(), new Hero());
        Iterator<Object> iterator = sac.iterator();
        while (iterator.hasNext()){
            System.out.println(iterator.next());
        }
        // or that's the same since sac is Iterable
        System.out.println("----");
        for (Object o : sac) {
            System.out.println(o);
        }
    }
}
```