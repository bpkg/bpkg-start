bpkg-start
==========

> A bpkg command plugin that invokes a 'start' command with 'pre' and 'post'
> life cycles.

## Install

Available as a [bpkg](http://www.bpkg.sh/)

```sh
bpkg install [-g] bpkg-start
```

## Usage

Add a `start` command in the `commands` object with optional `prestart`
and `poststart` commands which run before and after the `start` command
respectively.

```json
{
  "commands": {
    "prestart": "echo 'runs before start'",
    "start": "echo 'start command'",
    "poststart": "echo 'runs after start'"
  }
}
```

## License

MIT
