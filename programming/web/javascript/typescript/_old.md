# Typescript

<hr class="sl">

## My notes

This is a summary of things I used in TypeScript. Most of the things you will use are JavaScript features so I won't point them out.

```ts
class Example {
    private static SELECT_KEY = 'match_id';
    
    // contructor, only one per class
    constructor(){}

    // constructor(public id: number) {}
    
    // when declaring a function, you can add return
    // types
    static getString() : string | undefined { return ...; }

    // a getter
    get number() : number { return 10; };
    
    // a setter
    set number(n?: number) { /* code */ };

    private static generateHTML(matchSummary: MatchSummary) {}
}

class A {}
class B extends A {
    constructor() {
        super()
    }
}

const x = document.querySelector("#list")!!

// usage
let example : Example = new Example();
example.number; // evaluates as 10
example.number = 5; // ok since we created a setter
```

<hr class="sr">

## CheatSheets

To be honest, I haven't read them yet for I looked for some links just in case someone didn't known about this kind of document

* <http://hoomanb.com/cs/quickref/typescript_cheatsheet.pdf>
* <https://codingcheats.io/typescript>
* <https://elfi-y.medium.com/a-reference-sheet-for-typescript-function-class-379578e776fb>

<hr class="sl">

## Sources

* <https://www.typescriptlang.org/docs/>
* <https://www.codevscolor.com/pages/typescript-tutorials>