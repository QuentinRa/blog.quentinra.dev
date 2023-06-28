# React.js

<div class="row row-cols-md-2"><div>

[React.js](https://react.dev/) (210k ⭐) is a popular front-end framework. Due to it's popularity, there are some front-end framework based on React:

* [Next](https://github.com/vercel/next.js/) <small>(108k ⭐, web)</small>
* [React Native](https://github.com/facebook/react-native) <small>(110k ⭐, mobile)</small>
* [Preact](https://github.com/preactjs/preact) <small>(35k ⭐, small)</small>

There are also libraries of components such as [MUI](https://github.com/mui/material-ui) <small>(87k ⭐)</small>.
</div><div>

**Useful links** 📌

* [React Examples](https://reactjsexample.com/)
* [react-philosophies](https://github.com/mithi/react-philosophies)
</div></div>

<hr class="sep-both">

## React notes ☠️

<div class="row row-cols-md-2"><div>

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
ReactDOM.render(
  <React.StrictMode>
    <MyExample />
  </React.StrictMode>,
  document.getElementById("root")
);
```
</div><div>

You can use the `useState` react hooks for views with variables that may change. The view is updated when the variable is updated, and the view can update the variable.

```tsx!
[...]
const MyExample = () => {
  const [count, setCount] = useState<number>(0);
  useEffect(() => { /* onCountUpdated */ }, [count]);
  return (
    <>
      <p>{count}</p>
      <button onClick={() => setCount(count + 1)}>count++</button>
    </>
  );
};
```
</div></div>