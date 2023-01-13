# Jest.js

<div class="row row-cols-md-2"><div>

[jestjs](https://github.com/facebook/jest) (41k ⭐) is an alternative to mocha. Both have roughly the same syntax to declare test suites.

**Javascript**

```css!
npm install --save-dev jest
```

**Typescript**

```css!
npm install --save-dev jest @types/jest ts-jest
npx ts-jest config:init
```
</div><div>

You can write your tests in any folder, but the filename must follow the pattern: `name.test.js` or `name.test.ts`.

```javascript
// some test
test('xxx', () => {})
// some suite of tests
describe('xxx', () => {
    test('xxx', () => {})
    // ...
})
```

Usually, all tests are in a folder `__tests__`, and you will have multiple of these in your project.
</div></div>

<hr class="sep-both">

## Expect.js

Jest used a alternative syntax of expect.

<div class="row row-cols-md-2"><div>

```javascript
expect(xxx).toBeDefined()
expect(xxx).toBe(yyy)
// use not to negate something
expect(xxx).not.toBe(xxx)
```
</div><div>

```javascript
expect(xxx).toEqual({ key: value })
expect(xxx).toStrictEqual({ key: value })
expect(xxx).toBeLessThanOrEqual(yyy)
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [frisby](https://github.com/vlucas/frisby) (1.5k ⭐, HTTP)
</div><div>


</div></div>