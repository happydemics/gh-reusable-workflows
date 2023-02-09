# init-dependencies

Install / cache package.json dependencies using yarn

## Parameters

| Parameter             | Possible values / Type | Default value | Comment                                                                                           |
| --------------------- | ---------------------- | ------------- | ------------------------------------------------------------------------------------------------- |
| `cache-node-modules`  | `true` - `false`       | `true`        | Run `actions/cache` with `path: node_modules`.                                                    |
| `cache-yarn`          | `true` - `false`       | `true`        | Run `actions/cache` with `path: $(yarn cache dir)`.                                               |
| `checkout-repository` | `true` - `false`       | `true`        | Run `actions/checkout`.                                                                           |
| `inject-ssh-key`      | `string`               | `''`          | Inject the provided SSH key to the SSH Agent and pass it to `yarn install`.                       |
| `use-tool-versions`   | `true` - `false`       | `true`        | Specify if `actions/setup-node` should use `.tool-versions` (using `node-version-file`) argument. |

## Usage

```yaml
- name: Yarn install
  uses: /happydemics/gh-reusable-workflows/composite/init-dependencies@main
  with:
    inject-ssh-key: ${{ secrets.SSH_PRIVATE_KEY }}
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
        uses: /happydemics/gh-reusable-workflows/composite/init-dependencies@main
        with:
          inject-ssh-key: ${{ secrets.SSH_PRIVATE_KEY }}
      - run: yarn build
      - run: yarn test
```
