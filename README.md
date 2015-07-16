
React Lite Misc Components
----

Misc components from Talk by Teambition.

Demo: http://ui.talk.ai/react-lite-misc/

### Components

* `ColorChooser` simple color chooser
* `Copyarea` hover input and copy text
* `LoadingIndicator` animate three spots as loading
* `SwitchTabs` click tabs to switch
* `Switcher` iOS style of switching
* `Wheeling` debounce wheel events, detect loading more
* `SearchBox`
* `LoadingMore`
* `ImageLoading` show loading while image is loading

Writing docs for so many components is tough... Read [main.jsx](main) for details.

[main]: https://github.com/teambition/react-lite-misc/blob/gh-pages/src/main.jsx

### Usage

```bash
npm i --save react-lite-misc
```

Read [src/main.jsx](main) for details:

[main]: https://github.com/teambition/react-lite-misc/blob/gh-pages/src/main.jsx

### Develop

```text
npm i
```

You need a static file server for the HTML files. Personally I suggest using Nginx.

Develop:

```bash
gulp html # regenerate index.html
webpack-dev-server --hot # enable live-reloading
```

Build (Pack and optimize js, reivision js and add entry in `index.html`):

```bash
gulp build
```

### License

MIT
