# parallel-run

Permit to run multiple bash commands in parallel.

## Parameters

| Parameter         | Possible values / Type | Default value | Comment                                                         |
| ----------------- | ---------------------- | ------------- | --------------------------------------------------------------- |
| `commands_to_run` | `string`               | `''`          | Commands to run in parallel. Format: `'"command 1" "command 2'` |

## Usage

```yaml
- name: Lint and test
  uses: happydemics/gh-reusable-workflows/composite/parallel-run@main
  with:
    commands_to_run: '"yarn lint:all" "yarn unit:run"'
```

Full example :

```yaml
name: Example

on:
  push:
    branches:
      - main
  pull_request:

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Yarn install
        uses: happydemics/gh-reusable-workflows/composite/init-dependencies@main
        with:
          inject-ssh-key: ${{ secrets.SSH_PRIVATE_KEY }}
      - name: Lint and test
        uses: happydemics/gh-reusable-workflows/composite/parallel-run@main
        with:
          commands_to_run: '"yarn lint" "yarn unit:run"'
```
