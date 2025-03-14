# React.js

<div class="row row-cols-lg-2"><div>

[React.js](https://react.dev/) <small>(233k ⭐)</small> is a popular front-end framework. Due to its popularity, there are some front-end frameworks based on React:

* [Next](https://github.com/vercel/next.js/) <small>(130k ⭐, web)</small>
* [React Native](https://github.com/facebook/react-native) <small>(121k ⭐, mobile)</small>
* [Preact](https://github.com/preactjs/preact) <small>(37.2k ⭐, small)</small>

There are also libraries of components such as [MUI](https://github.com/mui/material-ui) <small>(95k ⭐)</small>.
</div><div>

**Useful links** 📌

* [React Examples](https://reactjsexample.com/)
* [react-philosophies](https://github.com/mithi/react-philosophies)
</div></div>

<hr class="sep-both">

## React notes ☠️

<div class="row row-cols-lg-2"><div>

You'll write components returning some HTML.

```tsx!
import React from 'react';

const MyExample = () => {
  return (
    <div>
      <h1>Hello, World!</h1>
    </div>
  );
};
```

You can use ReactDOM to render components:

```tsx!
import { createRoot } from "react-dom/client";

const root = createRoot(document.getElementById("root")!);
root.render(
  <React.StrictMode>
    <MyExample />
  </React.StrictMode>
);
```
</div><div>

You can use the `useState` react hooks for views with variables that may change. The view is updated when the variable is updated, and the view can update the variable.

```tsx!
[...]
const MyExample = () => {
  const [count, setCount] = useState<number>(0);
  useEffect(() => { /* onCountUpdated */ }, [count]);
  
  const increaseCount = () => {
    setCount(count + 1)
  }
  
  return (
    <>
      <p hidden={count !== 0} className="text-center">count > 0</p>
      <p>{count}</p>
      <button onClick={() => setCount(count + 1)}>count++</button>
      <button onClick={increaseCount}>count++</button>
    </>
  );
};
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

```tsx!
{
    entries?.map(function(entry: XXX) {
        return <p>{ entry.text }</p>
    })
}
```
</div><div>

```text!
JS: "react", "react-dom",
TS: "@types/react", "@types/react-dom"
```
</div></div>